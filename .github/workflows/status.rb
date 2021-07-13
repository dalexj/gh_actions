puts "hello from inside #{ENV["ALEX_VAR"]} #{ENV["ALEX_VAR"].to_s.length}"

GIT_LOG_FORMAT = "format:• <https://github.com/HotelEngine/he-api/commit/%H|%s> - %an".freeze

latest_tag = `git describe --abbrev=0 --tags --always`.chomp
formatted_recent_commits = `git log #{latest_tag}..HEAD --pretty="#{GIT_LOG_FORMAT}"`

def increment_minor_version(tag)
  split_versions = tag.split(".")
  [split_versions[0], (split_versions[1].to_i + 1), 0].join(".")
end

version = increment_minor_version(latest_tag)


tag_file = Tempfile.new
tag_file.write("Version #{version}\n\n#{formatted_recent_commits}\n\n")
puts "git tag -a #{version} --cleanup=verbatim --file #{tag_file.path}"
puts `git tag -a #{version} --cleanup=verbatim --file #{tag_file.path}`

puts "git push origin #{version}"
puts `git push origin #{version}`
