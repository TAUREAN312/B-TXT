print([[
 ___        _______ _       _
| __\      |__   __|\ \    / /
||  ||        | |    \ \  / /
||_//   ___   | |     \ \/ /
|| \\  |___|  | |     / /\ \
||__||        | |    / /  \ \
|___/         |_|   /_/    \_\  
 _______
|__   __|
   | |
   | |
   | |
   | |
   |_|]])

-- Help function
local function help()
  print("\nCOMMANDS AND MEANINGS\n")
  print("-n : Create a new file")
  print("-h : Help")
  print("-r : Open file (in read mode)")
  print("-s : Save file (use in editing mode)")
end

-- Create a new file and write to it
local function new()
  print("Enter Filename: ")
  local filename = io.read()
  local file = io.open(filename, "w")

  if not file then
    print("Error: Unable to create file!")
    return
  end

  print("Type Here (type '-s' to save and exit):")
  while true do
    local text = io.read()
    if text == "-s" then
      file:flush()
      print("File '" .. filename .. "' successfully saved!")
      break
    else
      file:write(text .. "\n")
    end
  end
  file:close()
end

-- Read a file
local function read()
  print("Enter Filename To Open: ")
  local filename = io.read()
  local file = io.open(filename, "r")

  if not file then
    print("Error: File does not exist!")
    return
  end

  print("\n--- File Content ---")
  print(file:read("*a"))
  file:close()
end

-- Main function
local function main()
  print("\n\nEnter Command or '-h' For Help")
  while true do
    local input = io.read()

    if input == "-h" then
      help()
    elseif input == "-n" then
      new()
    elseif input == "-r" then
      read()
    else
      print("Unknown command. Type '-h' for help.")
    end
  end
end

main()
