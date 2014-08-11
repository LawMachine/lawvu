# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  
 

  t1 = Task.find_or_create_by(task: 'prepare settlement offer')
  t2 = Task.find_or_create_by(task: 'respond to settlement offer')
  t3 = Task.find_or_create_by(task: 'prepare for highcourt hearing')
  t4 = Task.find_or_create_by(task: 'setup matter')
  t5 = Task.find_or_create_by(task: 'strategy meeting')
  t6 = Task.find_or_create_by(task: 'sign engagement letter')
  

  t7 = Task.create(task: 'Decide next course of action ', parent_id: t1.id)
  t8 = Task.create(task: 'Decide next course of action ', parent_id: t2.id)
  t9 = Task.create(task: 'complete risk assessment ', parent_id: t5.id)