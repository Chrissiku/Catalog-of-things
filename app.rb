require './spec/helper_spec'
require './json_data/preserve_data_module'
class App
    include Preserve_json_data
    def initialize
        @books = []
        @labels = []
        load_all_json_data
    end

    def is_empty(array)
        array.empty?
    end

    def message(text)
        puts "\n#{text}\n\n"
    end
    
    def add_book
        print "Publish date [YYYY-MM-DD] : "
        publish_date = gets.chomp

        print "Book Publisher : "
        publisher = gets.chomp

        puts "Enter Book Cover State"
        print"[bad, medium, good, excellent]: " 
        cover_state = gets.chomp

        book = Book.new(publish_date, publisher, cover_state)
        @books.push(book)
        message("New Book added successfully")
    end

    def list_books
        if is_empty(@books)
            message("No books in the catalog")
            return
        end
        puts "\n"
        @books.each_with_index do |book, i|
            puts "#{i+1}) #{book.cover_state} book published by #{book.publisher} on #{book.publish_date}"
        end
    end


    def add_label
        print "Label title : "
        title = gets.chomp

        print "Label color : "
        color = gets.chomp

        label = Label.new(title, color)
        @labels.push(label)
        message("New Label added successfully")
    end

    def list_labels
        if is_empty(@labels)
            message("No Label in the catalog")
            return
        end
        puts "\n"
        @labels.each do |label|
            puts "ID : #{label.id} => #{label.title} label with color #{label.color}"
        end
    end

    def save_all_json_data
        books = []
        # Save books
        @books.each do |book|
            books.push({
                publish_date: book.publish_date,
                publisher: book.publisher,
                cover_state: book.cover_state
            })
        end
        save_json_data(books, 'books')
    end

    def load_all_json_data
        books = load_json_data('books')
        books.each do |book|
            @books.push(Book.new(book['publish_date'], book['publisher'], book['cover_state']))
        end
    end
end 