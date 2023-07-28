Admin.create(email: "bondarolik@icloud.com", password: "12345678", password_confirmation: "12345678")

# Prepare labels
Label.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:labels)

[:bug, :enhancement, :feature, :question, :hotfix].each do |name|
  Label.create(name: name.to_s)
end
