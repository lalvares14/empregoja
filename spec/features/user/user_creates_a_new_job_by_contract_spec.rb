require 'rails_helper'

feature 'Visitor chooses job by contract' do
  scenario 'views the constract type' do
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

    visit new_job_path

    fill_in 'Title',       with: 'Dev Mais que Master'
    fill_in 'Location',    with: 'Recife'
    select  company.name,  from: 'Company'
    select  category.name, from: 'Category'
    select  contract.name, from: 'Contract'
    fill_in 'Description', with: 'Dev Junior Rails com ao menos um projeto'

    click_on 'Criar Vaga'

    expect(page).to have_content job.contract.name

  end
end
