require 'csvigo'

syn=csvigo.load{path='synsets.txt', header=false, verbose=false}.var_1
val=csvigo.load{path='val.txt', header=false, separator=' ', verbose=false}
local fname = val.var_1
local fclass = val.var_2
for i=1,#fclass do -- make it 1-indexed
   fclass[i] = fclass[i] + 1
end

-- make directories
for i=1,#syn do
   print('mkdir -p ' .. syn[i])
end

-- move files to directories
for i=1,#fclass do
   print('mv ' .. fname[i] .. ' ' .. syn[fclass[i]] .. '/')
end
