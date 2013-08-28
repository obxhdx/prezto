# encoding: utf-8
task default: [:install]

task :install do
  root_dir = ENV['HOME'] + '/.zprezto'
  FileUtils.ln_s File.join(Dir.pwd), root_dir unless File.exists? root_dir

  Dir.chdir(root_dir + '/runcoms')
  Dir.glob('z*') do |f|
    dotfile = File.join(ENV['HOME'], ".#{f}")
    if File.exists? dotfile
      puts "#{dotfile} already exists!"
    else
      FileUtils.ln_s File.join(Dir.pwd, f), dotfile
    end
  end
end

task :purge do
  Dir.glob("#{ENV['HOME']}/.z*").each do |f|
    FileUtils.rm_r f
    puts "#{f} deleted!"
  end
end
