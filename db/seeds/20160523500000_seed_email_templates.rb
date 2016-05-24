class SeedEmailTemplates < ActiveRecord::Migration
  EmailTemplate.create(
    subject: 'test',
    body: 'test body',
    type_of: 'alert')
end
