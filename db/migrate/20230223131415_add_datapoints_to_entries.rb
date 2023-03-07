class AddDatapointsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :fuelload, :decimal, :precision => 3, :scale => 1
    add_column :entries, :endfuel, :decimal, :precision => 3, :scale => 1
    add_column :entries, :date, :datetime
    add_column :entries, :run, :integer
    add_column :entries, :gearing, :string
    add_column :entries, :prepressure, :decimal, :precision => 3, :scale => 1
    add_column :entries, :postpressure, :decimal, :precision => 3, :scale => 1
    add_column :entries, :rearwidth, :integer
    add_column :entries, :frontwidth, :string
    add_column :entries, :needleclip, :integer
    add_column :entries, :jet, :integer
    add_column :entries, :bestlap, :float
    add_column :entries, :secondbestlap, :float
    add_column :entries, :thirdbestlap, :float
    add_column :entries, :time, :time
    add_column :entries, :airmix, :float
    add_column :entries, :idle, :float
    add_column :entries, :rimset, :string
    add_column :entries, :tyre, :string
    add_column :entries, :tyreset, :string
    add_column :entries, :camber, :string
    add_column :entries, :caster, :string
    add_column :entries, :toe, :string
    add_column :entries, :frontride, :string
    add_column :entries, :rearride, :string
    add_column :entries, :plug, :string
    add_column :entries, :frontbar, :string
    add_column :entries, :fuelmix, :string
    add_column :entries, :condition, :string
    add_column :entries, :chain, :integer
    add_column :entries, :axle, :string
    add_column :entries, :endweight, :float
    add_column :entries, :lapcount, :integer
    add_column :entries, :enginehour, :decimal, :precision => 4, :scale => 2
    add_column :entries, :tyreage, :integer
    add_column :entries, :waddingage, :decimal, :precision => 4, :scale => 2
    add_column :entries, :gearoilage, :decimal, :precision => 4, :scale => 2
    add_column :entries, :sessiontype, :string
    add_column :entries, :mainchanges, :string
    add_column :entries, :sessionnotes, :text
    add_column :entries, :besttoprevs, :integer
    add_column :entries, :bestbottomrevs, :integer
    add_column :entries, :secondbestlaptoprevs, :integer
    add_column :entries, :secondbestlapbottomrevs, :integer
    add_column :entries, :thirdbesttoprevs, :integer
    add_column :entries, :thirdbestbottomrevs, :integer
    add_column :entries, :highestrevs, :integer
    add_column :entries, :engine, :string
  end
end
