<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App::uses('AppModel', 'Model');

/**
 * CakePHP Story
 * @author desktop-13
 */
class Review extends AppModel {

     var $name='Review';
     var $foreignKey='cook_id';
     var $actsAs = array(
       'AggregateCache'=>array(
			'val_rating'=>array('model'=>'User', 'avg'=>'reviews_avg_val_rating'),
			'ontime_rating'=>array('model'=>'User', 'avg'=>'reviews_avg_ontime_rating'),
			'easyfind_rating'=>array('model'=>'User', 'avg'=>'reviews_avg_easyfind_rating'),
            array('conditions'=>array(), 'recursive'=>-1)
      )); 
	public $belongsTo=array('User'=>array('foreignKey'=>'cook_id'));
    
}
