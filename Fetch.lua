--[[ TODO
Something of a simple version-control system.
Running the function with the name of a directory connects to the computer
  running FetchCloud attempts to download the latest version of the given
  software.
@author Miller Hollinger
v0.1
]]

-- Where the computer with FetchCloud is running.
local cloudChannel = 216
-- A simple hash. Responses from the server are listened to on this channel.
local deviceID = os.getComputerID() * 3319 % 5569

-- TODO Check that this computer has a modem.

--[[ TODO
Fetches a directory.
If the directory is found running on FetchCloud, copies it to the root, deleting
  any existing directory with the same name in the process.
  directory, string: The directory to fetch.
]]
function fetch(directory)
  -- Check if the given directory exists on FetchCloud.
  -- Delete any directory with matching name.
  -- Copy the directory.
end

--[[ TODO
Checks if a directory exists on the FetchCloud.
  directory, string: The directory to search for.
]]
function directoryExists(directory)

end

--[[ TODO
Copies the directory with the given name to the root from FetchCloud.
  directory, string: The directory to copy.
]]
function copyOver(directory)

end
