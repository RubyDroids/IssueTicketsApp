User.create(email: "bondarolik@icloud.com", password: "issuepp2024!", password_confirmation: "issuepp2024", admin: true)

# Prepare labels
Label.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:labels)

[:bug, :enhancement, :feature, :question, :hotfix].each do |name|
  Label.create(name: name.to_s)
end
