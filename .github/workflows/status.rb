puts "hello from inside #{ENV["ALEX_VAR"]} #{ENV["ALEX_VAR"].to_s.length}"

GIT_LOG_FORMAT = "format:• <https://github.com/HotelEngine/he-api/commit/%H|%s> - %an".freeze
TAG_FILE_PATH = "./tmp/tag_description"

latest_tag = `git describe --abbrev=0 --tags --always`.chomp
formatted_recent_commits = `git log #{latest_tag}..HEAD --pretty="#{GIT_LOG_FORMAT}"`

def increment_minor_version(tag)
  split_versions = tag.split(".")
  [split_versions[0], (split_versions[1].to_i + 1), 0].join(".")
end

version = increment_minor_version(latest_tag)

`mkdir ./tmp`
File.write(TAG_FILE_PATH, "Version #{version}\n\n#{formatted_recent_commits}\n\n")
puts "git config --global user.email \"alex@example.com\""
puts `git config --global user.email "alex@example.com"`
puts "git config --global user.name \"Automatic Alex\""
puts `git config --global user.name "Automatic Alex"`
puts "git tag -a #{version} --cleanup=verbatim --file=#{TAG_FILE_PATH}"
puts `git tag -a #{version} --cleanup=verbatim --file=#{TAG_FILE_PATH}`
p File.read(TAG_FILE_PATH)

puts "git push --tags"
puts `git push --tags`
