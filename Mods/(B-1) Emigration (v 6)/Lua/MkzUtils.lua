-- Utils
-- Author: Mk Z
-- DateCreated: 3/13/2016 8:38:37 AM
--------------------------------------------------------------
function Round(val)
	if val - math.floor(val) < .5 then
		return math.floor(val);
	else
		return math.ceil(val);
	end
end
--------------------------------------------------------------
function Log2(n)
local _n = 2
local x = 1
    if (_n < n) then
        repeat
            x = x + 1
            _n = _n + _n
        until (_n >= n)
    elseif (_n > n) then
        if (n == 1) then
            return 0
        else
            return nil
        end
    end 
    if (_n > n) then
        return x-1
    else
        return x
    end 
end
--------------------------------------------------------------
function LogN(arg, base)
	return math.log(arg)/math.log(base);
end
--------------------------------------------------------------
function Pad(str, len, left, char)
	len = (len or 20) - #str;
	char = char or ' ';
	if left or false then 
		return string.rep(char, len) .. str;	-- pad left
	else
		return str .. string.rep(char, len);	-- pad right (default)
	end
end
--------------------------------------------------------------