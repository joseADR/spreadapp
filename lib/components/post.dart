
import 'package:flutter/material.dart';


const btnColor = Color.fromRGBO(145,145,145,0.9);

Widget post(String title, String description){
  return Card(

    
    color: Colors.black12.withOpacity(0.3),
    margin: const EdgeInsets.only(left:6.0,right:6.0,bottom:12.0,top:0.0),
    
    

    //Column with image and descriptions
    
    child: Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      
                         
        //Container for image
       
       
           Container(
                    margin: EdgeInsets.only(left:2.0,right: 2.0,top:2.0),
                    child:Image.network(
                   'http://www.afortunadas.com.br/wp-content/uploads/2017/06/festival_de_fries_ribeirao_preto_1200x635px_0-1160x635.jpg',
                    fit: BoxFit.fill,
                    
                               
                  ),
                   
     
                   
            color: Color.fromRGBO(200,200,200,.5),
            
            width: double.infinity,
            height: 178.0,),
        
    
        //Container with title and buttons
        Container(
          margin: EdgeInsets.only(top:9.0),
          //Column with title and buttons
          child: Column(
            children: [
              //Title container
              Container(
                padding: EdgeInsets.only(bottom: 6.0),
                child:Text(
                  title.toUpperCase(), 
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              
              //Row with buttons
              Row(      
                children: [    
                  //Perfil Circle Image
                  Container(
                    margin: EdgeInsets.only(top:0.0,right:0.0,left: 18.0,bottom: 15.0),
                    width: 49.0,
                    height: 49.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "http://1.bp.blogspot.com/-bdhuDXmNZdc/TZZDxXGvXnI/AAAAAAAAAJM/ClB1rJ_zVeQ/s1600/skol.png")))
        ),         

                  Container(
                    
                    padding: EdgeInsets.only(left:0.8),
                    child:Row(
                      children:[
                        Container(
                    padding: EdgeInsets.only(right: 10.0,left: 58.5,top:5.0,bottom: 10.0),
                    child: Column(
                      children: [
                        Icon(Icons.save,size: 19.0,color: btnColor,),
                        Container (
                          padding: EdgeInsets.only(top:6.0),
                          child: 
                          Column(children: <Widget>[
                            Text("Salvar", style: TextStyle(fontSize: 11.0,color: btnColor),)
                        ],

                        ),)                  
                        
                      ],
                    ),
                  ),
                  //Share Button
               
                  Container(
                    padding: EdgeInsets.only(right: 0.0,left: 8.0,top:5.0,bottom: 10.0),
                    child: Column(
                     
                      children: [
                        
                        Icon(Icons.share,size: 19.0,color: btnColor)
                        ,
                        Container(
                          padding: EdgeInsets.only(top:6.0),
                          child: Column(
                            children: <Widget>[
                              Text("Compartilhar", style: TextStyle(fontSize: 11.0,color: btnColor),)
                            ]
                          ),
                        )
                        
                        
                      ],
                    ),
                  ),


                      ],
                    ),
                  ),
                  //Save Button
                  
                  //Find more Button
                  
                  Expanded(                   
                    child: FlatButton(child: 
                    Container(padding: EdgeInsets.only(top:30.0,left: 17.0,bottom: 13.0),
                      child: Text(
                        "Saiba Mais",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          
                        ),
                      ), 
                      ),
                      
                      
                    onPressed: null,
                    )
                    
                  ),
                ],
                
              )
            ],
          ),
        )
      ],
    ),
  ); 
}