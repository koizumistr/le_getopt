class LE_GETOPT_TEST

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      local
         getopt: LE_GETOPT; i: INTEGER; d: DICTIONARY[STRING, CHARACTER]
      do
         create getopt
         getopt.set_option(once "bar", True, 'b')
         getopt.set_option(once "foofoo", False, 'f')

         d := getopt.getopt

         std_output.put_string(once "== options ==%N")
         from
            i := d.lower
         until
            i > d.upper
         loop
            std_output.put_string(d.key(i).to_string + once " : " + d.item(i) + once "%N")
            i := i + 1
         end

         std_output.put_new_line
         std_output.put_string(once "== arguments ==%N")
         from
            i := 1
         until
            i > argument_count
         loop
            std_output.put_string(argument(i) + once "%N")
            i := i + 1
         end
      end

end -- class LE_GETOPT_TEST
