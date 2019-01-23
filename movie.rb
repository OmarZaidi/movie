$movies = Hash.new("EMPTY_VALUE")
$movies = {
  dogma: 0,
  seven: 0
  }

def start
  puts "What would you like to do?"
  puts "-- Type 'add' to add a movie."
  puts "-- Type 'update' to update a movie."
  puts "-- Type 'display' to display all movies."
  puts "-- Type 'delete' to delete a movie."
	print "ENTER:"
  $choice = gets.chomp
  check
end

def check
  if $choice.downcase == "display"
    display
    elsif $choice.downcase == "update"
    	update
      elsif $choice.downcase == "add"
    		add
        elsif $choice.downcase == "delete"
    			delete
        else
          puts "Error!"
    			start
        end
end

def add
  print "Type a movie:"
  added_movie = gets.chomp
  print "Give a rating:"
  rating = gets.chomp
  $movies[added_movie.to_sym] = rating
  puts "added"
  start
end

def display
  puts "--MOVIES--"
  $movies.each{|key, value| puts "#{key}: #{value}"}
  start
end

def delete
  puts "--MOVIES--"
  $movies.each_key{|key| puts key}
  puts "--Which movie do you want to delete?--"
  print "ENTER:"
  delete_movie = gets.chomp
  $movies.delete(delete_movie.intern) { |el| "#{el} not found" }
  puts "#{delete_movie} was DELETED"
  start
end

def update
  puts "Which movie do you want to update?"
  puts "--MOVIES--"
  $movies.each{|key, value| puts "#{key}: #{value}"}
  puts "ENTER:"
  movie = gets.chomp
  puts "What rating do you want to give #{movie}?"
  value = gets.chomp
  $movies[movie.intern] = value
  start
end


start
check
