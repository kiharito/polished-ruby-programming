# frozen_string_literal: true

str = String.new
str << "test" << "ing...1...2"

name = ARGV[1].to_s.gsub('cool', 'amazing').capitalize

str << ". Found: " << name
puts str

# ----------

builder = TextBuilder.new
builder.append("test")
builder.append("ing,,,1,,,2")

modifier = TextModifier.new
name = modifier.gsub(ARGV[1].to_s, 'cool', 'amazing')
name = modifier.capitalize(name)

builder.append(". Found: ")
builder.append(name)

puts builder.as_string
