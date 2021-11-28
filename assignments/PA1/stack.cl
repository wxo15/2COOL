(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class List inherits A2I {
   item: Object;
   next: List;
   tempa: Object;
   tempb: Object;
   
   init(i: Object, n: List): List {
      {
         item <- i;
         next <- n;
         self;
      }
   };
   
   list_out(): String{
      let string: String <-
         case item of
            i: Int => i2a(i);
            s: String => s;
            o: Object => {abort(); "";};
         esac
      in
      if (isvoid next) 
         then string
      else
         string.concat("\n".concat(next.list_out()))
      fi
   };
   
   operation(): List{
      if item = "+" then next.add_val()
      else if item = "s" then next.sub()
      else self
      fi fi
   };
   
   add_val(): List{
      add_item(item, next);
   };
   
   add_item(i: Int, n: List): List {
   	n.item = n.item + i;
   	n;
   }
   
   sub(i: List): List{
         a = i.item;
         i <- i.next;
         b = stack.item;
         i <- stack.next;
         i <- (new List).init(a, i);
         i <- (new List).init(b, i);
   };
};

class Main inherits IO {
   in_str: String;
   stack: List;
   nil: List;
   temp_list: List;
   
   main() : Object {
      {
         stack <- nil;
         out_string(">");
         in_str <- in_string();
               
         while not in_str = "x"
         loop
            {
               if in_str = "e"
                  then 
                   {
                      if stack.item = "+"
                        then
                        {
                        stack <- stack.next
                        a = stack.item
                        stack <- stack.next
                        b = stack.item
                        stack.item = a + b
                        }
                     else if stack.item = "s"
                        then
                        {
                        stack <- stack.next
                        a = stack.item
                        stack <- stack.next
                        b = stack.item
                        stack <- stack.next
                        stack <- (new List).init(a, stack)
                        stack <- (new List).init(b, stack)
                        }
                     fi fi;                      
                   }
               else if in_str = "d"
                  then out_string(stack.list_out())
               else stack <- (new List).init(in_str, stack)
               fi fi;
               
               out_string(">");
               in_str <- in_string();
            }
         pool;
      }	
   };

};
