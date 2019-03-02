require 'rails_helper'
#validates :name, :price, :total_seat, :aval_seat, :start_location, :status, :country, :state, :user_id, presence: true
RSpec.describe Tour, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      tour = Tour.new( price:'99', total_seat:'100', aval_seat:'100', start_location:'shanghai', status:'Future', country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures price presence' do
      tour = Tour.new(name:'t1',  total_seat:'100', aval_seat:'100', start_location:'shanghai', status:'Future', country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures total_seat presence' do
      tour = Tour.new(name:'t1', price:'99',  aval_seat:'100', start_location:'shanghai', status:'Future', country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures aval_seat presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', start_location:'shanghai', status:'Future', country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures start_location presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', aval_seat:'100',  status:'Future', country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures status presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', aval_seat:'100', start_location:'shanghai',  country:'china',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures country presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', aval_seat:'100', start_location:'shanghai', status:'Future',state:'Shanxi', user_id:'1' ).save
      expect(tour).to eq(false)
    end



    it 'ensures state presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', aval_seat:'100', start_location:'shanghai', status:'Future', country:'china', user_id:'1' ).save
      expect(tour).to eq(false)
    end

    it 'ensures user_id presence' do
      tour = Tour.new(name:'t1', price:'99', total_seat:'100', aval_seat:'100', start_location:'shanghai', status:'Future', country:'china',state:'Shanxi' ).save
      expect(tour).to eq(false)
    end

  end

  context 'scope tests' do
  end
end
