function checkNameFormat(name)
    if not checkAlphanumeric(name) then
        if not checkForNumbers(name) then
            local stringLength = string.len(name)
            if stringLength > 0 and stringLength < Config.MaxNameLength then
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

function checkDOBFormat(dob)
    local date = tostring(dob)
    if checkDate(date) then
        return true
    else
        return false
    end
end

function checkSexFormat(sex)
    if sex == "m" or sex == "M" or sex == "f" or sex == "F" then
        return true
    else
        return false
    end
end

function checkHeightFormat(height)
    local numHeight = tonumber(height)
    if numHeight < Config.MinHeight and numHeight > Config.MaxHeight then
        return false
    else
        return true
    end
end

function formatName(name)
    local loweredName = convertToLowerCase(name)
    local formattedName = convertFirstLetterToUpper(loweredName)
    return formattedName
end

function convertToLowerCase(str)
    return string.lower(str)
end

function convertFirstLetterToUpper(str)
    return str:gsub("^%l", string.upper)
end

function checkAlphanumeric(str)
    return (string.match(str, "%W"))
end

function checkForNumbers(str)
    return (string.match(str,"%d"))
end

function checkDate(str)
    if string.match(str, '(%d%d)/(%d%d)/(%d%d%d%d)') ~= nil then
        local m, d, y = string.match(str, '(%d+)/(%d+)/(%d+)')
        m = tonumber(m)
        d = tonumber(d)
        y = tonumber(y)
        if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= Config.LowestYear) or (y > Config.HighestYear)) then
            return false
        elseif m == 4 or m == 6 or m == 9 or m == 11 then
            if d > 30 then
                return false
            else
                return true
            end
        elseif m == 2 then
            if y%400 == 0 or (y%100 ~= 0 and y%4 == 0) then
                if d > 29 then
                    return false
                else
                    return true
                end
            else
                if d > 28 then
                    return false
                else
                    return true
                end
            end
        else
            if d > 31 then
                return false
            else
                return true
            end
        end
    else
        return false
    end
end