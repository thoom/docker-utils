require 'yaml'

def build_cmd(docker_tag)
  cmd = 'clear && docker exec -it $1 bash'
  yaml_file = File.expand_path('~/.docker-exec.yml')
  if File.exist?(yaml_file)
    config = YAML.load_file(yaml_file)
    cmd_pieces = []
    if config.key?('env')
      config['env'].each { |key, value| cmd_pieces << "export #{key.upcase}='#{value}'" }
    end

    if config.key?('bashrc')
      cmd_pieces << 'if [[ ! -e ~/.bashrc ]]; then touch ~/.bashrc; fi'
      cmd_pieces << 'if [[ ! -e ~/.bashrc-backup ]]; then cp ~/.bashrc ~/.bashrc-backup; fi'
      cmd_pieces << 'if [[ -e ~/.bashrc-docker-exec ]]; then cp ~/.bashrc-backup ~/.bashrc; fi'
      cmd_pieces << 'rm -f ~/.bashrc-docker-exec'
      config['bashrc'].each { |line| cmd_pieces << "echo \\\"#{line.tr('"', "'")}\\\" >> ~/.bashrc-docker-exec" }
      cmd_pieces << 'echo \\"source ~/.bashrc-docker-exec\\" >> ~/.bashrc'
    end

    if config.key?('cmd')
      config['cmd'].each { |line| cmd_pieces << line.gsub('"', '\\"') }
    end

    unless cmd_pieces.empty?
      cmd_pieces << 'bash'
      cmd += " -c \"#{cmd_pieces.join(' && ')}\""
    end
  end

  docker_tag = ARGV[ARGV.length - 1]
  cmd.gsub(/\$1/, docker_tag).gsub(/\$2/, docker_tag.tr('_', '-'))
end


if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    puts 'You need to pass in a docker tag name'
    exit
  end

  puts build_cmd(ARGV[ARGV.length - 1])
end
