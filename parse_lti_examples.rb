require './lti_example'

apps = JSON.parse(File.read('./public/data/lti_examples.json'))

admin_permission = AdminPermission.new(apps: 'any')

apps.each_with_index do |app, idx|
  obj = App.build_or_update(app['id'], app, admin_permission)
  json = obj.settings
  puts ""
  puts "#{idx} " + app['id'] + " #{obj.id}"
  puts Hasher.diff(app, json).to_json
  puts "---"
end.length
