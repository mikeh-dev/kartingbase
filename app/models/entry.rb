class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :chassis
  belongs_to :track

  accepts_nested_attributes_for :track

  validates :track_id, :date, :time, :run, :gearing, :prepressure, :rearwidth, :frontwidth, :needleclip, :jet, :airmix, :idle, :rimset, :tyre, :tyreset, :camber, :caster, :toe, :frontride, :rearwidth, :plug, :frontbar, :fuelload, :fuelmix, :condition, :chain, :axle, :enginehour, :tyreage, :waddingage, :gearoilage, :sessiontype, :chassis_id, presence: true

  def self.last_entry_for_user(user_id)
    where(user_id: user_id).last
  end

  def self.last_entry_data_for_user(user_id)
    last_entry = last_entry_for_user(user_id)

    if last_entry
      {
        track_id: last_entry.track_id,
        chassis_id: last_entry.chassis_id,
        fuelload: last_entry.fuelload,
        endfuel: last_entry.endfuel,
        date: last_entry.date,
        run: last_entry.run,
        gearing: last_entry.gearing,
        prepressure: last_entry.prepressure,
        postpressure: last_entry.postpressure,
        rearwidth: last_entry.rearwidth,
        frontwidth: last_entry.frontwidth,
        needleclip: last_entry.needleclip,
        jet: last_entry.jet,
        bestlap: last_entry.bestlap,
        secondbestlap: last_entry.secondbestlap,
        thirdbestlap: last_entry.thirdbestlap,
        time: last_entry.time,
        airmix: last_entry.airmix,
        idle: last_entry.idle,
        rimset: last_entry.rimset,
        tyre: last_entry.tyre,
        tyreset: last_entry.tyreset,
        camber: last_entry.camber,
        caster: last_entry.caster,
        toe: last_entry.toe,
        frontride: last_entry.frontride,
        rearride: last_entry.rearride,
        plug: last_entry.plug,
        frontbar: last_entry.frontbar,
        fuelmix: last_entry.fuelmix,
        condition: last_entry.condition,
        chain: last_entry.chain,
        axle: last_entry.axle,
        endweight: last_entry.endweight,
        lapcount: last_entry.lapcount,
        enginehour: last_entry.enginehour,
        tyreage: last_entry.tyreage,
        waddingage: last_entry.waddingage,
        gearoilage: last_entry.gearoilage,
        sessiontype: last_entry.sessiontype,
        mainchanges: last_entry.mainchanges,
        sessionnotes: last_entry.sessionnotes,
        besttoprevs: last_entry.besttoprevs,
        bestbottomrevs: last_entry.bestbottomrevs,
        secondbestlaptoprevs: last_entry.secondbestlaptoprevs,
        secondbestlapbottomrevs: last_entry.secondbestlapbottomrevs,
        thirdbesttoprevs: last_entry.thirdbesttoprevs,
        thirdbestbottomrevs: last_entry.thirdbestbottomrevs,
        highestrevs: last_entry.highestrevs
      }
    else
      {}
    end
  end
end
