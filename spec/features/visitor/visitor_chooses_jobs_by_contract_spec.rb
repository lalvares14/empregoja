require 'rails_helper'

feature 'Visitor chooses jobs by contract' do
  scenario 'two job with the same contract' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    contract = Contract.create(name: 'CLT')

    job = Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               category: category,
               contract: contract)

    job_2 = Job.create(title: 'Vaga de Dev',
                       description: 'Dev Junior Rails com ao menos um projeto',
                       location: 'São Paulo',
                       company: company,
                       category: category,
                       contract: contract)
    visit root_path

    click_on contract.name

    expect(page).to have_content contract.name

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location

    expect(page).to have_content job_2.title
    expect(page).to have_content job_2.category.name
    expect(page).to have_content job_2.description
    expect(page).to have_content job_2.location
  end

  scenario 'and does not see other contract jobs' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    contract = Contract.create(name: 'CLT')

    category = Category.create(name: 'Desenvolvedor')

    contract_2 = Contract.create(name: 'PJ')

    job = Job.create(title: 'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo',
                     company: company,
                     category: category,
                     contract: contract)

    visit root_path

    click_on contract_2.name

    expect(page).to have_content contract_2.name

    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
  end

end
