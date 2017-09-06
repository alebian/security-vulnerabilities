namespace :passwords do
  desc 'Get all users passwords hashes'
  task get_all: :environment do
    filename = Rails.root.join('extras', 'passwords.txt')
    file = File.open(filename, 'a+')
    User.find_each do |user|
      file.write(user.hashed_password)
      file.write("\n")
    end
    file.close
  end
end
