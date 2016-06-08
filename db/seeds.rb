# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new
admin.email = ENV['admin_email']
admin.password = ENV['admin_password']
admin.password_confirmation = ENV['admin_password']
admin.is_admin = true
admin.save

normal_user = User.new
normal_user.email = ENV['normal_user_email']
normal_user.password = ENV['normal_user_password']
normal_user.password_confirmation = ENV['normal_user_password']
normal_user.is_admin = false
normal_user.save