# ____ _  _ ____ ____ ____ ____ _  _ ____
# |    |__| |___ |___ |    |  | |\ | |___
# |___ |  | |___ |    |___ |__| | \| |
#

myproject = ENV['PROJECT'] || 'ENTER PROJECT NAME' # <----
instancename = ENV['INSTANCE'] || 'test-machine' # <----
cred_path = ENV['CRED_PATH'] || 'ENTER PATH TO YOUR CREDENTIAL HERE' # <----

gauth_credential 'mycred' do
  action :serviceaccount
  path cred_path
  scopes [
    'https://www.googleapis.com/auth/compute'
  ]
end

gcompute_zone 'us-west1-a' do
  action :create
  project myproject
  credential 'mycred'
end

gcompute_instance instancename do
  action :delete
  zone 'us-west1-a'
  project myproject
  credential 'mycred'
end
