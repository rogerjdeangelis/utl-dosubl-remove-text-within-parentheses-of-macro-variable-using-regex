Dosubl remove text within parentheses of macro variable using regex                                                   
                                                                                                                      
github                                                                                                                
https://tinyurl.com/y4m5woek                                                                                          
https://github.com/rogerjdeangelis/utl-dosubl-remove-text-within-parentheses-of-macro-variable-using-regex            
                                                                                                                      
StackOverflow                                                                                                         
https://tinyurl.com/y6b5pvya                                                                                          
https://stackoverflow.com/questions/56839376/remove-text-within-parentheses-of-macro-variable-using-regex             
                                                                                                                      
Much less Kligon code and more mautainable?                                                                           
                                                                                                                      
*_                   _                                                                                                
(_)_ __  _ __  _   _| |_                                                                                              
| | '_ \| '_ \| | | | __|                                                                                             
| | | | | |_) | |_| | |_                                                                                              
|_|_| |_| .__/ \__,_|\__|                                                                                             
        |_|                                                                                                           
;                                                                                                                     
                                                                                                                      
%let string = try (to) remove (this);                                                                                 
                                                                                                                      
*            _               _                                                                                        
  ___  _   _| |_ _ __  _   _| |_                                                                                      
 / _ \| | | | __| '_ \| | | | __|                                                                                     
| (_) | |_| | |_| |_) | |_| | |_                                                                                      
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                     
                |_|                                                                                                   
;                                                                                                                     
                                                                                                                      
 %put &=result;                                                                                                       
                                                                                                                      
 result = try remove                                                                                                  
                                                                                                                      
*          _       _   _                                                                                              
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                   
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                  
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                 
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                 
                                                                                                                      
;                                                                                                                     
                                                                                                                      
                                                                                                                      
                                                                                                                      
%symdel result string col /nowarn; * just in case;                                                                    
%macro text(col=);                                                                                                    
                                                                                                                      
     %local result; /* remove if you want global result */                                                            
                                                                                                                      
     %let rc=%sysfunc(dosubl('                                                                                        
         data _null_;                                                                                                 
           result = compbl(prxchange("s/\(([^\)]+)\)//i", -1, "&col"));                                               
           call symputx("result",result);                                                                             
         run;quit;                                                                                                    
     '));                                                                                                             
                                                                                                                      
     %put &=result;                                                                                                   
                                                                                                                      
%mend text;                                                                                                           
                                                                                                                      
%let string = try (to) remove (this);                                                                                 
%text(col=&string);                                                                                                   
                                                                                                                      
                                                                                                                      
                                                                                                                      
