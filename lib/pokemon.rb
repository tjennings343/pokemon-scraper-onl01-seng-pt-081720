class Pokemon
    attr_accessor :name, :type, :db,:id

    def initialize(name:,type:,db:,id:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?);", name,type)
    end

    def self.find(id,db)
        found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
        Pokemon.new(name: found_pokemon[1],type: found_pokemon[2],db: db, id: found_pokemon[0])
    end

end
