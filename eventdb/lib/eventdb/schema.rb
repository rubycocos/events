# encoding: utf-8

module EventDb

class CreateDb

def up
  ActiveRecord::Schema.define do

create_table :events do |t|
  t.string  :title,      null: false   ##  title (just the first link text)
  t.string  :link        ## for now optional - why? why not??
  t.string  :place,      null: false
  t.date    :start_date, null: false   ## use (rename) to start_at - why? why not?
  t.date    :end_date,   null: false   ## use (rename) to end_at   - why? why not?
  t.integer :days,       null: false

  t.timestamps
end

  end  # Schema.define
end # method up

end # class CreateDb

end # module EventDb
