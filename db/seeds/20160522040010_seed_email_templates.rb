class SeedEmailTemplates < ActiveRecord::Migration
  EmailTemplate.create(
    subject: 'test',
    body: 'test body',
    kind: 'alert')
end
