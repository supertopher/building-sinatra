
get '/'  do
  @user = User.create!(name: "topher")
  haml :index

end