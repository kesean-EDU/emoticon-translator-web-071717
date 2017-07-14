# require modules here
require 'yaml'

def load_library(libray_path)
  emoticon = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(libray_path).each do |word, emoticons|
    english, japanese = emoticons
    emoticon["get_emoticon"][english] = japanese
    emoticon["get_meaning"][japanese] = word
  end
  return emoticon
end

def get_japanese_emoticon(libray_path, emoticon)
  library = load_library(libray_path)
  answer = library["get_emoticon"][emoticon]
  if answer
    return answer
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(libray_path, emoticon)
  library = load_library(libray_path)
  answer = library["get_meaning"][emoticon]
  if answer
    return answer
  else
    "Sorry, that emoticon was not found"
  end
end
