class LE_GETOPT

insert
   ARGUMENTS

feature {ANY}
   set_option (long_opt: STRING; has_arg: BOOLEAN; short_opt: CHARACTER)
      do
         short_opts.add_last(short_opt)
         long_opts.add_last(long_opt)
         arg_array.add_last(has_arg)
      end

   getopt: DICTIONARY[STRING, CHARACTER]
      local
         i, idx: INTEGER; arg_i, s: STRING
      do
         from
            i := 1
         until
            i > argument_count
         loop
            arg_i := command_arguments.item(i)
            if arg_i.has_prefix("--") then
               arg_i.remove_head(2)
               idx := long_opts.last_index_of(arg_i)
               if idx /= -1 then
                  if arg_array.item(idx) then
                     d.add(command_arguments.item(i + 1), short_opts.item(idx))
                     command_arguments.remove(i + 1)
                  else
                     d.add("", short_opts.item(idx))
                  end
               end

               command_arguments.remove(i)
            elseif arg_i.has_prefix("-") then
               arg_i.remove_head(1)
               from
               until
                  arg_i.count = 0
               loop
                  idx := short_opts.last_index_of(arg_i.first)
                  if idx /= -1 then
                     if arg_array.item(idx) then
                        if arg_i.count > 1 then
                           arg_i.remove_head(1)
                           create s.make_from_string(arg_i)
                           d.add(s, short_opts.item(idx))
                        else
                           d.add(command_arguments.item(i + 1), short_opts.item(idx))
                           command_arguments.remove(i + 1)
                        end
                        arg_i.clear_count
                     else
                        d.add("", short_opts.item(idx))
                        arg_i.remove_head(1)
                     end
                  else
                     std_error.put_string("Unknown option: " + arg_i.first.to_string + "%N")
                     arg_i.remove_head(1)
                  end
               end
               command_arguments.remove(i)
            else
               i := i + 1
            end
         end
         Result := d
      end

feature {}
   short_opts: FAST_ARRAY[CHARACTER]
      once
         create Result
      end

   long_opts: FAST_ARRAY[STRING]
      once
         create Result
      end

   arg_array: FAST_ARRAY[BOOLEAN]
      once
         create Result
      end

   d: HASHED_DICTIONARY[STRING, CHARACTER]
      once
         create Result
      end

end -- class LE_GETOPT
