require 'nanoc/tasks'

require 'stringex'
  desc "Create a new guide"
  task :new_guide, :title do |t, args|
  mkdir_p './content/Guides'
  args.with_defaults(:title => 'New Guide')
  title = args.title
  filename = "./content/Guides/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"

  if File.exist?(filename)
    abort('rake aborted!') if ask("#{filename} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  puts "Creating new guide: #{filename}"
  open(filename, 'w') do |guide|
    post.puts '---'
    post.puts "title: \"#{title}\""
    post.puts "created_at: #{Time.now}"
    post.puts 'kind: article'
    post.puts 'published: false'
    post.puts "---\n\n"
  end
end
