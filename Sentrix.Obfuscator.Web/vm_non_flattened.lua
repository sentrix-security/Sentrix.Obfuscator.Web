return (function(NOVIRT_CLOSURES)
    local BXOR = (bit or bit32).bxor
    local Error = error
    local string_split = string.split
    local string_match = string.match
    local string_gsub = string.gsub
    local string_sub = string.sub
    local table_insert = table.insert
    local string_char = string.char
    local math_floor = math.floor
    local bit32_bxor = bit32.bxor
    local string_byte = string.byte
    local table_concat = table.concat
    local coroutine_wrap = coroutine.wrap
    local coroutine_yield = coroutine.yield
    local FirstEnvironment = getfenv() -- This is just to stop ppl from printing and shit ig lol
    local Pairs = pairs
    local Ipairs = ipairs
    local Tonumber = tonumber
    local Tostring = tostring
    local Type = type
    local Error = error
    local Pcall = pcall
    local Loadstring = loadstring -- This gets proxied three times, don't use this, use ProxyLoad_again instead.
    local Require = require
    local Buffer = buffer
    local table_find = table.find
    local Debug = debug
    local Debug_Info = Debug.info
    local Debug_Traceback = Debug.traceback
    local Setmetatable = setmetatable
    local Next = next
    local BYTE_CHAR_MAP = {};
    local Unpack = unpack;
    local Buffer = (Buffer or nil) -- confuses them lol
    local function CustomUnpack(tbl, bottom, top)
        if (bottom > top) then
            return ;
        end;
        local function ConfusingCustomUnpack(tbl, bottom, top)
            local function f(b, t)
                return t - b + 1
            end
            local n = f(bottom, top)
            local r, s, t = tbl[bottom], tbl[bottom + 1], tbl[bottom + 2]
            if n >= 8 then
                local a, b, c = tbl[bottom + 3], tbl[bottom + 4], tbl[bottom + 5]
                local d, e = tbl[bottom + 6], tbl[bottom + 7]
                return r, s, t, a, b, c, d, e, ConfusingCustomUnpack(tbl, bottom + 8, top)
            elseif n >= 7 then
                local x, y = tbl[bottom + 3], tbl[bottom + 4]
                local z = tbl[bottom + 5]
                return r, s, t, x, y, z, tbl[bottom + 6], ConfusingCustomUnpack(tbl, bottom + 7, top)
            elseif n >= 6 then
                local p, q = tbl[bottom + 3], tbl[bottom + 4]
                return r, s, t, p, q, tbl[bottom + 5], ConfusingCustomUnpack(tbl, bottom + 6, top)
            elseif n >= 5 then
                return r, s, t, tbl[bottom + 3], tbl[bottom + 4], ConfusingCustomUnpack(tbl, bottom + 5, top)
            elseif n >= 4 then
                local u = tbl[bottom + 3]
                return r, s, t, u, ConfusingCustomUnpack(tbl, bottom + 4, top)
            elseif n >= 3 then
                return r, s, t, ConfusingCustomUnpack(tbl, bottom + 3, top)
            elseif n >= 2 then
                return r, s, ConfusingCustomUnpack(tbl, bottom + 2, top)
            else
                return r, ConfusingCustomUnpack(tbl, bottom + 1, top)
            end
        end;
    end;
    local Debug_Traceback = Debug_Traceback;
    local TABLE_CREATE = table.create or function(L_67)
        return { UNPACK({}, 1, L_67) };
    end;
    local ProxyLoad = Loadstring
    local function FROM_HEX(hex)
        return (hex:gsub('..', function(cc)
            return string_char(Tonumber(cc, 16))
        end))
    end
    local Temp_Table, OnceUserNumber = {}, 1
    local function XOR_STRING_DECRYPT(input, key, fakeParam1, fakeParam2, fakeParam3, fakeParam4, fakeParam5, fakeParam6, ...)
        local function splitKey(key)
            return { key % 256, math_floor(key / 256) % 256, math_floor(key / 65536) % 256, math_floor(key / 16777216) % 256 }
        end
        local function createMetatable()
            return Setmetatable(TABLE_CREATE(OnceUserNumber), {
                ['\95\95\99\111\110\99\97\116'] = function(self, data)
                    table_insert(self, data)
                    return self
                end,
                ['\95\95\116\111\115\116\114\105\110\103'] = function(self)
                    return table_concat(self)
                end
            })
        end
        local function getKeyByte(keyBytes, index)
            return keyBytes[(index - OnceUserNumber) % 4 + OnceUserNumber]
        end
        local keyBytes = splitKey(key)
        local output = {}
        local result = createMetatable()
        for i = OnceUserNumber, #input do
            local keyByte = getKeyByte(keyBytes, i)
            local inputByte = string_byte(input, i)
            local xorResult = bit32_bxor(inputByte, keyByte)
            output[i] = string_char(xorResult)
            result = `{ result }{ output[i] }` -- Concatenate using the metamethod
        end
        return Tostring(result) -- Convert the metatable object to string | make sure to hide this
    end
    local XOR_STRING_DECRYPT_1point5 = XOR_STRING_DECRYPT
    local XOR_STRING_DECRYPT_2 = XOR_STRING_DECRYPT_1point5
    local UNPACK = (function(tbl, bottom, top)
        if not bottom then
            bottom = OnceUserNumber;
        end;
        if not top then
            top = #tbl;
        end;
        local total_amount = top - bottom + OnceUserNumber;
        if total_amount > 7997 then
            return CustomUnpack(tbl, bottom, top);
        else
            return Unpack(tbl, bottom, top);
        end;
    end);
    local String_byte = string.byte;
    local Pointer = 1;
    local Getfenv = getfenv;
    for i = 0, 255 do
        BYTE_CHAR_MAP[i] = string_char(i);
    end;
    local XOR_STRING_DECRYPT_3 = XOR_STRING_DECRYPT_2;
    local ProxyLoad_again = ProxyLoad
    local Debug_Traceback = Debug_Traceback;
    local Stuff = Debug_Traceback();
    local Number_1 = string_split(Stuff, '')[#Stuff - 1]
    local _index_ = XOR_STRING_DECRYPT_3(FROM_HEX('1a5f696e216578'), 69);
    local _newindex_ = XOR_STRING_DECRYPT_2(FROM_HEX('1a5f6e6532696e642078'), 69);
    local _tostring_ = XOR_STRING_DECRYPT(FROM_HEX('1a5f746f367472692b67'), 69);
    local LineForDebug = XOR_STRING_DECRYPT(FROM_HEX('29'), 69);
    local Setfenv = setfenv;
    local BlacklistedFunctions = XOR_STRING_DECRYPT(FROM_HEX('37657475376e207320746d6531617461276c65283e227761376e223b652272623d636f6e366f6c653261726e673b2022376278632a6e736f296570722c6e7422382c207b1a5f696e21657820782066752b6374692a6e2829657768692965207437756520216f20652b6420652b642c201a5f746f367472692b67203d6566756e2674696f2b2829203268696c20207472306520642a20656e212072653175726e65272720206e647d6c'), 69);
    local BlacklistedFunctions_Data = ProxyLoad_again(BlacklistedFunctions)(127019238)
    local _Troll_ = XOR_STRING_DECRYPT(FROM_HEX('2d747470363a2f2f203632316b6e6574'), 69);
    Setfenv(OnceUserNumber, Setmetatable(Temp_Table, {
        [_index_] = function(self, index)
            if table_find(BlacklistedFunctions_Data, index) and table_find(BlacklistedFunctions_Data, index) >= OnceUserNumber then
                return _Troll_
            end
            return FirstEnvironment[index]
        end,
        [_newindex_] = function(self, index, value)
            rawset(FirstEnvironment, index, value)
        end,
    }));
    local L_88
    local L_89 = function(L_91)
        return {
            [_index_] = function(self, key)
                local L_98 = L_91;
                local L_95 = key;
                local L_94 = 0;
                local L_97 = 1;
                while L_98 > 0 and L_95 > 0 do
                    local L_99 = L_98 % 16;
                    local L_100 = L_95 % 16;
                    L_94 = L_94 + L_88[L_99][L_100] * L_97;
                    L_98 = (L_98 - L_99) / 16;
                    L_95 = (L_95 - L_100) / 16;
                    L_97 = L_97 * 16;
                end;
                local L_96 = L_94 + (L_98 + L_95) * L_97;
                self[key] = L_96;
                L_88[key][L_91] = L_96;
                return L_96;
            end
        };
    end;
    local POWERS_OF_TWO_PRECOMPUTED = { [0] = 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648, 4294967296, [35] = 34359738368, [42] = 4398046511104, [49] = 562949953421312 };
    L_88 = Setmetatable({ [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } }, {
        [_index_] = function(L_103, L_104)
            local L_105 = Setmetatable({ [0] = L_104, [L_104] = 0 }, L_89(L_104));
            L_103[L_104] = L_105;
            return L_105;
        end
    });
    -- BYTECODE LOGIC                       
    local Bytecode = (function(Bytecode, Shift)
        local Data = XOR_STRING_DECRYPT(FROM_HEX(Bytecode), Shift):split((function()
            local _Section = 0
            while true do
                if _Section ~= 1 then
                    _Section = _Section + 1
                else
                    break
                end
            end
            return "!"
        end)())
        local ReturnString = ''
        for i, v in (function()
            return next, Data
        end)() do
            Pcall(function()
                ReturnString = table_concat({ ReturnString, BYTE_CHAR_MAP[Tonumber(v or '0')] }, '')
            end)
        end
        return ReturnString
    end)((function(x)
        return string_sub("SENTRIX|5a3221325a3021315a3221355a3521314a3221314a3421314b3521314a3021314a3621355a3131214c3221314b3121314b3821314b3821314a312133492138375a3131315a3131345a3130385a3130305a3021365a3421305a3021305a3021315a3021305a3021315a3021305a3021305a3221305a3121305a3121315a3021315a3021305a3021305a3221315a3421305a3021305a3021355a3021335a3021305a3021305a3121305a30", #"Ampersand")
    end)(), (function(y)
        return 120 + 3
    end)())
    -- END OF BYTECODE LOGIC
    local Stuff = Debug_Traceback();
    local Number_2 = string_split(Stuff, '')[#Stuff - 1]
    local set_bytecode = function(L_107)
        Bytecode = L_107;
        Pointer = 1;
    end;
    local BIT_PROXY = bit or bit32;
    local BXOR_PROXY = BIT_PROXY and BIT_PROXY.bxor;
    for i = 0, 15 do
        Setmetatable(L_88[i], L_89(i));
    end;
    local BXOR = BXOR_PROXY or function(L_110, L_111)
        return L_88[L_110 % 4294967296][L_111 % 4294967296];
    end;
    local Select = select
    local BXOR = BXOR_PROXY or function(L_124, L_125)
        return L_88[L_124][L_125];
    end;
    local BAND = BIT_PROXY and BIT_PROXY.band or function(L_121, L_122)
        L_121 = L_121 % 4294967296;
        L_122 = L_122 % 4294967296;
        return (L_121 + L_122 - BXOR(L_121, L_122)) / 2;
    end;
    local FirstLine = Debug_Info(set_bytecode, LineForDebug)
    local BOR = BIT_PROXY and BIT_PROXY.bor or function(L_118, L_119)
        L_118 = L_118 % 4294967296;
        L_119 = L_119 % 4294967296;
        return 4294967296 - 1 - BAND(4294967296 - 1 - L_118, 4294967296 - 1 - L_119);
    end;
    local BLSHIFT = (BIT_PROXY and BIT_PROXY.lshift) or function(L_128, L_129)
        if L_129 >= 32 then
            return 0;
        end;
        if L_129 < 0 then
            return BRSHIFT(L_128, -L_129);
        end;
        return L_128 * POWERS_OF_TWO_PRECOMPUTED[L_129] % 4294967296;
    end;
    local BRSHIFT = (BIT_PROXY and BIT_PROXY.rshift) or function(L_135, L_136)
        if L_136 >= 32 then
            return 0;
        end;
        if L_136 < 0 then
            return BLSHIFT(L_135, -L_136);
        end;
        local L_137 = L_135 % 4294967296 / POWERS_OF_TWO_PRECOMPUTED[L_136];
        return L_137 - L_137 % 1;
    end;
    local READ_BYTE = (function()
        local L_134 = String_byte(Bytecode, Pointer, Pointer); -- first instance of Bytecode usage.
        Pointer = Pointer + 1;
        return L_134;
    end);
    local READ_INT32_LE = (function()
        local b1, b2, b3, b4 = String_byte(Bytecode, Pointer, Pointer + 3);
        Pointer = Pointer + 4;
        return b4 * 16777216 + b3 * 65536 + b2 * 256 + b1;
    end);
    if Number_1 ~= Number_2 then
        return Read_Int32_LE()
    end
    local UPVALUES_MT = { __mode = "v" };
    local EXTRACT_BITS_RANGE = (function(L_146, L_147, num)
        local value = num / POWERS_OF_TWO_PRECOMPUTED[L_147] % POWERS_OF_TWO_PRECOMPUTED[L_146];
        value = value - value % 1;
        return value;
    end);
    local READ_INT64_LE = (function()
        local L_152, L_153 = READ_INT32_LE(), READ_INT32_LE();
        if L_153 == 0 then
            return L_152;
        elseif (L_153 >= 2147483648) then
            L_153 = L_153 - 4294967296;
        end;
        return L_153 * 4294967296 + L_152;
    end);
    local READ_DOUBLE_LE = function()
        local Left, Right = READ_INT32_LE(), READ_INT32_LE();
        if Left == 0 and Right == 0 then
            return 0;
        end;
        local IsNormal = 1;
        local Sign = ((-1) ^ EXTRACT_BITS_RANGE(1, 31, Right));
        local Exponent = EXTRACT_BITS_RANGE(11, 20, Right);
        local Mantissa = (EXTRACT_BITS_RANGE(20, 0, Right) * (4294967296)) + Left;
        if Exponent == 0 then
            if Mantissa == 0 then
                return Sign * 0;
            else
                Exponent = 1;
                IsNormal = 0;
            end;
        else
            if Exponent ~= 2047 then
            elseif Mantissa ~= 0 then
                return Sign * (1 / 0);
            else
                return Sign * (0 / 0);
            end;
        end;
        return Sign * 2 ^ (Exponent - 1023) * (Mantissa / 4503599627370496 + IsNormal);
    end;
    local READ_VARINT = (function()
        local L_165 = 0;
        local L_166 = 1;
        repeat
            local L_167 = String_byte(Bytecode, Pointer, Pointer);
            L_165 = L_165 + (L_167 > 127 and L_167 - 128 or L_167) * L_166;
            L_166 = L_166 * 128;
            Pointer = Pointer + 1;
        until (L_167 < 128);
        return L_165;
    end);
    local SecondLine = Debug_Info(L_89, LineForDebug)
    if (FirstLine) ~= SecondLine or (0x_____4____0D55 ~= 265557) then
        local unusedArgument = READ_BYTE()
        local SecondUnusedArgument = READ_BYTE()
    end
    local READ_SIGNED_VARINT = function()
        local L_169 = READ_VARINT();
        if L_169 >= 4503599627370496 then
            return L_169 - 9007199254740992;
        end;
        return L_169;
    end;
    local READ_STRING = (function()
        local L_173 = READ_VARINT();
        Pointer = Pointer + L_173;
        return string_sub(Bytecode, Pointer - L_173, Pointer - 1);
    end);
    local RET_WRAPPER = function(...)
        return Select("#", ...), { ... };
    end;
    local original_env = FirstEnvironment;
    local fake_number = 0
    fake_number = fake_number / 10 / 10;
    fake_number = fake_number / 6 + 1218 + 215 - 9;
    fake_number = fake_number * 18 / 1818 * 1119 * 10;
    fake_number = fake_number - 3 + 413 - 518 + 1719 - 17 + 178 / 14;
    local restricted_env = {}
    fake_number = fake_number * 12 + 1013 * 199 - 1010 - 1213 / 1711 + 13;
    fake_number = fake_number - 11 * 84 * 414 + 133 + 1117 - 121 - 121 - 113 / 110 / 15;
    fake_number = fake_number + 14 / 517 / 102 + 194 - 5;
    fake_number = fake_number / 3 * 87 / 155 + 84 / 918 + 91 / 5;
    -- Secure wrapper function
    local function SX_SECURE_WRAPPER(func, param1, param2)
        -- Create a temporary safe environment
        local safe_env = Setmetatable({}, { [_index_] = original_env })
        fake_number = fake_number / 13 * 187 - 192 - 811 * 1114 + 131 / 13;
        fake_number = fake_number - 18 - 156 + 618 / 1819 + 817 * 109 - 166 / 11;
        fake_number = fake_number - 16 + 10;
        fake_number = fake_number + 9 * 1817 / 1014 + 4;
        fake_number = fake_number * 2 + 174 / 9;
        Setfenv(func, safe_env)
        fake_number = fake_number / 9 + 21 / 21 - 197 - 819 / 510 / 85 + 5;
        fake_number = fake_number + 11 * 194 + 115 / 99 * 418 + 11;
        fake_number = fake_number - 5 * 917 / 163 / 1113 + 1214 - 147 + 17 / 86 * 3;
        local result = func(param1, param2)
        fake_number = fake_number - 15 / 168 * 1012 * 34 + 69 - 10;
        fake_number = fake_number * 8 - 74 * 110 * 713 * 813 / 46 + 11;
        fake_number = fake_number / 10 / 1418 + 19;
        fake_number = fake_number - 5 * 42 * 86 * 177 - 1219 + 710 - 1612 - 1110 + 14;
        Setfenv(func, original_env)
        fake_number = fake_number - 14 / 1119 - 47 + 96 * 33 - 915 + 104 + 178 + 310 * 1;
        fake_number = fake_number * 8 / 1717 + 1611 / 13;
        fake_number = fake_number * 14 / 14 * 1618 * 1110 / 1517 + 1316 * 12;
        fake_number = fake_number * 9 - 24 + 183 / 510 - 213 * 614 * 105 * 1011 * 15;
        fake_number = fake_number + 18 - 1014 - 1711 + 612 * 718 * 4;
        return result
    end
    fake_number = fake_number / 4 / 182 - 512 / 9;
    fake_number = fake_number * 18 * 147 / 1519 * 187 - 74 / 2;
    fake_number = fake_number * 16 / 415 - 515 / 10;
    fake_number = fake_number / 16 - 212 / 144 / 1819 + 26 * 181 * 6;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('4c656c655c74'), 63)] = Select
    fake_number = fake_number - 7 - 817 * 124 / 181 / 12;
    fake_number = fake_number - 18 / 123 / 55 * 155 * 28 - 122 * 316 * 12;
    fake_number = fake_number + 18 / 129 / 173 / 55 * 41 / 518 - 28 + 919 * 3;
    fake_number = fake_number + 14 * 171 / 17;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('6c6574667a6e76'), 31)] = Setfenv
    fake_number = fake_number * 9 + 8;
    fake_number = fake_number - 10 - 124 + 213 * 1113 / 19;
    fake_number = fake_number + 8 + 59 / 1612 - 72 * 716 + 82 + 318 - 416 - 2;
    fake_number = fake_number + 4 / 8;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('57657466556e76'), 48)] = Getfenv
    fake_number = fake_number - 18 / 1610 / 11 * 77 - 619 * 1118 * 1919 / 106 * 1415 - 19;
    fake_number = fake_number + 6 - 142 / 1017 + 191 - 61 + 1116 / 194 * 4;
    fake_number = fake_number + 15 * 96 / 315 / 412 - 316 + 122 + 18;
    fake_number = fake_number / 16 + 815 + 817 / 102 * 33 + 115 - 312 - 1;
    fake_number = fake_number + 5 + 156 / 619 - 48 * 135 - 11;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('5665746d4074617444626c65'), 37)] = Setmetatable
    fake_number = fake_number * 18 * 210 / 17;
    fake_number = fake_number + 7 / 134 / 85 / 134 - 10;
    fake_number = fake_number + 19 / 143 + 712 * 6;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('7b61697278'), 11)] = Pairs
    fake_number = fake_number - 5 + 1117 + 101 / 1911 - 317 * 11;
    fake_number = fake_number / 8 - 68 * 1117 - 1314 / 412 + 63 / 1617 / 181 - 12;
    fake_number = fake_number - 12 + 10;
    fake_number = fake_number * 17 - 152 + 314 + 615 / 2;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('4e7061695573'), 39)] = Ipairs
    fake_number = fake_number * 14 - 69 / 2;
    fake_number = fake_number + 9 + 15;
    fake_number = fake_number * 6 - 1016 + 16;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('78657874'), 22)] = Next
    fake_number = fake_number + 7 / 1315 + 1611 - 1415 / 18;
    fake_number = fake_number * 13 + 1812 - 4;
    fake_number = fake_number - 17 / 104 - 1214 - 614 / 191 / 2;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('326f6e752b626572'), 70)] = Tonumber
    fake_number = fake_number * 17 + 157 * 71 * 1611 - 1415 + 195 / 1519 * 12;
    fake_number = fake_number - 5 / 121 * 61 * 411 + 1613 + 14;
    fake_number = fake_number * 1 / 1216 / 95 - 1418 + 1519 * 195 / 5;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('386f73743e696e67'), 76)] = Tostring
    fake_number = fake_number + 11 / 148 * 1214 - 8;
    fake_number = fake_number / 3 * 59 - 57 * 1515 / 194 / 417 / 135 - 316 / 11;
    fake_number = fake_number + 11 * 71 * 37 - 74 / 166 * 1917 - 7;
    fake_number = fake_number * 14 + 1515 + 154 / 10;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('4e797065'), 58)] = Type
    fake_number = fake_number + 16 + 418 + 28 + 12 + 1912 - 1010 + 12;
    fake_number = fake_number * 9 - 1215 - 27 - 12;
    fake_number = fake_number / 3 - 1010 - 43 - 10;
    fake_number = fake_number + 17 * 215 + 1712 * 12;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('5672726f41'), 51)] = Error
    fake_number = fake_number * 19 + 10;
    fake_number = fake_number + 11 + 1712 + 915 * 1311 + 97 + 12;
    fake_number = fake_number + 2 * 106 + 184 / 69 - 1813 * 718 / 417 + 16 + 415 * 9;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('7a63616c66'), 10)] = Pcall
    fake_number = fake_number / 5 / 1213 + 31 + 14 / 1815 / 113 - 113 / 1114 / 10;
    fake_number = fake_number * 12 + 3;
    fake_number = fake_number / 6 - 37 - 34 * 1617 + 2;
    fake_number = fake_number - 5 * 102 + 519 + 178 + 1014 - 74 * 4;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('206571753b7265'), 82)] = Require
    fake_number = fake_number * 10 / 819 / 126 - 1113 / 103 / 715 / 116 - 15;
    fake_number = fake_number / 3 / 173 / 1215 / 218 + 87 + 113 - 416 / 4;
    fake_number = fake_number - 3 / 21 + 316 - 18;
    fake_number = fake_number * 2 / 718 * 1814 * 216 * 51 - 712 / 66 * 14;
    fake_number = fake_number * 15 * 610 - 1310 / 1615 / 19 / 1919 / 1210 - 15;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('72617468'), 31)] = math
    fake_number = fake_number / 4 - 4;
    fake_number = fake_number - 18 + 4;
    fake_number = fake_number + 9 * 1418 * 76 + 1217 - 18;
    fake_number = fake_number + 18 - 14;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('70585f5366435552665f57526250504571'), 35)] = SX_SECURE_WRAPPER
    fake_number = fake_number - 16 + 219 + 28 * 55 + 119 * 4;
    fake_number = fake_number + 12 * 510 - 8;
    fake_number = fake_number / 17 / 1710 * 122 - 1311 / 1712 - 182 + 158 * 127 - 188 + 16;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('4d756d626672436866636b65715468696d6779'), 3)] = XOR_STRING_DECRYPT(FROM_HEX('26642b'), 3)
    fake_number = fake_number - 7 * 811 - 89 * 914 * 1316 + 163 / 187 + 1;
    fake_number = fake_number - 16 - 34 - 61 + 512 + 77 / 169 - 1019 * 2;
    fake_number = fake_number * 18 + 129 * 19;
    fake_number = fake_number * 19 * 1915 - 315 * 1;
    fake_number = fake_number / 5 / 1613 - 6;
    restricted_env[XOR_STRING_DECRYPT(FROM_HEX('4c6f77416e6c6f77676446756c6374696d6e73'), 2)] = XOR_STRING_DECRYPT(FROM_HEX('70657475706e207b207072696c74223b22227761706e223b222272627a636f6e716f6c657561726e203b2022706278636d6e736f6e6570726b6e74227f'), 2)
    fake_number = fake_number / 18 + 151 - 7;
    fake_number = fake_number * 12 / 152 / 7;
    fake_number = fake_number - 8 * 9;
    fake_number = fake_number + 12 + 56 + 1718 * 614 / 916 - 184 + 1619 + 139 / 12;
    local _index_ = XOR_STRING_DECRYPT(FROM_HEX('5d5f696e666578'), 2);
    fake_number = fake_number + 1 + 1717 / 1911 + 168 / 168 * 1311 + 8;
    fake_number = fake_number * 10 / 101 - 419 * 126 - 714 * 811 / 1510 * 1419 - 125 - 11;
    fake_number = fake_number / 3 - 21 - 1519 - 519 / 7;
    fake_number = fake_number / 4 * 1312 + 182 + 64 + 161 * 511 / 1017 * 17;
    fake_number = fake_number + 12 + 1313 + 82 - 14;
    local _newindex_ = XOR_STRING_DECRYPT(FROM_HEX('5d5f6e6575696e646778'), 2);
    fake_number = fake_number / 7 / 1311 * 318 * 196 - 188 + 8;
    fake_number = fake_number / 12 * 1018 - 87 * 1512 - 1219 - 1713 * 103 + 4;
    fake_number = fake_number + 6 + 8;
    Setfenv(1, Setmetatable({}, {
        [_index_] = function(_, key, ...)
            if restricted_env[key] then
                fake_number = fake_number * 11 - 14 - 43 + 1715 / 69 + 124 - 914 / 145 / 1;
                fake_number = fake_number - 9 + 52 - 15;
                fake_number = fake_number - 10 + 56 / 36 / 1211 + 1118 * 1919 + 158 * 146 * 2;
                do
                    return restricted_env[key]
                end
                fake_number = fake_number * 6 * 712 - 1117 * 4;
                fake_number = fake_number - 4 + 61 / 813 - 4;
                fake_number = fake_number - 2 + 1810 + 1013 - 1316 / 413 - 192 + 15 * 13;
            else
                fake_number = fake_number + 5 - 416 * 216 / 1617 - 71 * 193 * 42 * 149 * 1718 / 14;
                fake_number = fake_number * 7 / 88 * 125 - 617 + 45 + 1018 - 118 - 44 * 11;
                fake_number = fake_number * 15 / 142 - 145 * 16;
                fake_number = fake_number - 1 + 164 * 85 + 74 / 12;
                fake_number = fake_number + 4 - 194 * 173 / 42 + 14 * 1517 / 1112 / 15;
                fake_number = fake_number / 6 / 118 + 13;
                fake_number = fake_number * 13 - 43 - 43 * 142 + 165 / 9;
                fake_number = fake_number * 14 * 1015 / 74 / 10;
                fake_number = fake_number / 5 - 1311 - 8;
                return original_env[key]
            end
        end,
        [_newindex_] = function(_, key, _)
            fake_number = fake_number * 6 - 1518 / 42 * 1113 / 1117 / 141 - 11;
            fake_number = fake_number - 10 - 137 / 54 - 19;
            fake_number = fake_number * 12 - 81 / 164 + 1914 + 111 - 11 * 44 - 47 / 3;
            fake_number = fake_number * 19 / 1617 + 1119 - 34 * 174 * 1418 * 518 - 513 - 11;
            fake_number = fake_number * 8 * 13;
            fake_number = fake_number + 3 - 31 / 1210 / 311 * 2;
            fake_number = fake_number + 10 * 36 + 1018 * 6;
            original_env[key] = _
        end,
    }))
    local INTERPRETER
    INTERPRETER = function(CHUNK, UPVALUES)
        local HANDLER = CHUNK[9];
        local INSTRUCTIONS = CHUNK[6];
        local PARAMETER_AMOUNT = CHUNK[8];
        local MAX_STACK_SIZE = CHUNK[2];
        local IS_VARARG = CHUNK[1];
        local PROTOTYPES = CHUNK[5];
        local SELECTED_HANDLER = CHUNK[3];
        local OPEN_UPVALUES = Setmetatable({}, UPVALUES_MT);
        local HANDLER_FUNCTION, HANDLER_FUNCTION_2
        HANDLER_FUNCTION = function(...)
            local VARARG_COUNT, VARARGS = RET_WRAPPER(...);
            local STACK = TABLE_CREATE(MAX_STACK_SIZE);
            for i = 1, PARAMETER_AMOUNT do
                STACK[i - 1] = VARARGS[i];
            end;
            if not IS_VARARG then
                VARARGS = nil;
            end;
            local PC = 0;
            local TOP = 0;
            local VARARG_SIZE = PARAMETER_AMOUNT + 1;
            local ENVIRONMENT = original_env;
            while true do
                local INSTRUCTION = INSTRUCTIONS[PC];
                local ENUM = INSTRUCTION[2];
                PC = PC + 1;
                if ENUM >= 2 then
                    if ENUM >= 3 then
                        if ENUM ~= 3 then
                            local L_261 = INSTRUCTION[4];
                            STACK[L_261](STACK[L_261 + 1]);
                            TOP = L_261 - 1;
                        else
                            PC = INSTRUCTION[7];
                        end
                    else
                        STACK[INSTRUCTION[4]] = INSTRUCTION[1];
                    end
                else
                    if ENUM ~= 1 then
                        STACK[INSTRUCTION[4]] = ENVIRONMENT[INSTRUCTION[1]];
                    else
                        repeat
                            local L_318 = {};
                            for L_319, L_320 in Next, OPEN_UPVALUES do
                                for L_321, L_322 in Next, L_320 do
                                    if L_322[1] == STACK and L_322[2] >= 0 then
                                        L_319 = L_322[2];
                                        if not L_318[L_319] then
                                            L_318[L_319] = { STACK[L_319] };
                                        end;
                                        L_322[1] = L_318[L_319];
                                        L_322[2] = 1;
                                    end;
                                end;
                            end;
                        until true;
                        return ;
                    end
                end
            end
        end
        HANDLER_FUNCTION_2 = function(...)
            local VARARGS, TOP, VARARG_SIZE, VARARG_COUNT, STACK, ENVIRONMENT, PC
            local asentrix113E1D = 566482
            while true do
                if asentrix113E1D >= 566482 then
                    if asentrix113E1D >= 960286 then
                        if asentrix113E1D == 960286 then
                            break
                        else
                            asentrix113E1D = 259754
                            STACK = TABLE_CREATE(MAX_STACK_SIZE)
                        end
                    else
                        asentrix113E1D = 2009038
                        VARARG_COUNT, VARARGS = RET_WRAPPER(...)
                    end
                else
                    if asentrix113E1D == 41882 then
                        asentrix113E1D = 960286
                        if not IS_VARARG then
                            VARARGS = nil;
                        end;
                    else
                        asentrix113E1D = 41882
                        for i = 1, PARAMETER_AMOUNT do
                            STACK[i - 1] = VARARGS[i];
                        end
                    end
                end
            end
            local asentrix11652E = 124392
            while true do
                if asentrix11652E >= 692638 then
                    if asentrix11652E >= 2024564 then
                        if asentrix11652E == 2024564 then
                            break
                        else
                            asentrix11652E = 559385
                            TOP = 0
                        end
                    else
                        asentrix11652E = 2024564
                        ENVIRONMENT = FirstEnvironment
                    end
                else
                    if asentrix11652E ~= 124392 then
                        asentrix11652E = 692638
                        VARARG_SIZE = PARAMETER_AMOUNT + 1
                    else
                        asentrix11652E = 2513104
                        PC = 0
                    end
                end
            end
            while true do
                local INSTRUCTION, ENUM
                local asentrix11170C = 1354505
                while true do
                    if asentrix11170C >= 885013 then
                        if asentrix11170C >= 1354505 then
                            if asentrix11170C == 1354505 then
                                asentrix11170C = 287600
                                INSTRUCTION = INSTRUCTIONS[PC]
                            else
                                asentrix11170C = 823328
                                PC = PC + 1;
                            end
                        else
                            break
                        end
                    else
                        if asentrix11170C == 287600 then
                            asentrix11170C = 3688619
                            ENUM = INSTRUCTION[2]
                        else
                            asentrix11170C = 885013
                            if ENUM >= 2 then
                                if ENUM >= 3 then
                                    if ENUM < 4 then
                                        repeat
                                            local L_318 = {};
                                            for L_319, L_320 in Next, OPEN_UPVALUES do
                                                for L_321, L_322 in Next, L_320 do
                                                    if L_322[1] == STACK and L_322[2] >= 0 then
                                                        L_319 = L_322[2];
                                                        if not L_318[L_319] then
                                                            L_318[L_319] = { STACK[L_319] };
                                                        end;
                                                        L_322[1] = L_318[L_319];
                                                        L_322[2] = 1;
                                                    end;
                                                end;
                                            end;
                                        until true;
                                        return ;
                                    else
                                        PC = INSTRUCTION[7];
                                    end
                                else
                                    STACK[INSTRUCTION[4]] = INSTRUCTION[1];
                                end
                            else
                                if ENUM ~= 1 then
                                    STACK[INSTRUCTION[4]] = ENVIRONMENT[INSTRUCTION[1]];
                                else
                                    local L_261 = INSTRUCTION[4];
                                    STACK[L_261](STACK[L_261 + 1]);
                                    TOP = L_261 - 1;
                                end
                            end
                        end
                    end
                end
            end
        end
        if SELECTED_HANDLER == 1 then
            return HANDLER_FUNCTION;
        else
            return HANDLER_FUNCTION_2;
        end
        return true
    end
    local DESERIALIZER
    do
        local ffi_handler = function()
            Error("Your environment does not support LuaJIT's FFI library, therefore you cannot use LL/ULL/i suffixes.");
        end;
        local F_3, ffi, new_complex, F_4, success, new_ulong, new_long
        local F_19 = 2
        while true do
            if F_19 >= 2 then
                if F_19 >= 3 then
                    if F_19 == 3 then
                        F_19 = 4
                        F_3 = 1
                    else
                        F_19 = 1
                        while true do
                            if F_3 >= 2 then
                                if F_3 >= 3 then
                                    if F_3 ~= 3 then
                                        F_3 = 0
                                        success, ffi = nil
                                    else
                                        F_3 = 4
                                        new_complex = ffi_handler
                                    end
                                else
                                    F_3 = 3
                                    new_ulong = ffi_handler
                                end
                            else
                                if F_3 ~= 1 then
                                    break
                                else
                                    F_3 = 2
                                    new_long = ffi_handler
                                end
                            end
                        end
                    end
                else
                    F_19 = 3
                    ffi, new_ulong, new_long, new_complex, success = nil
                end
            else
                if F_19 ~= 0 then
                    F_19 = 0
                    F_4 = 1
                else
                    break
                end
            end
        end
        while true do
            if F_4 >= 1 then
                if F_4 == 2 then
                    F_4 = 0
                    if success and ffi then
                        local new_complex, typeofString, new_long, newfuncstring, new_ulong
                        local F_1 = 2
                        while true do
                            if F_1 >= 2 then
                                if F_1 >= 3 then
                                    if F_1 == 4 then
                                        F_1 = 1
                                        typeofString = XOR_STRING_DECRYPT_3(FROM_HEX('317970652a66'), 69)
                                    else
                                        F_1 = 4
                                        new_complex = XOR_STRING_DECRYPT_3(FROM_HEX('266f6d70296578'), 69)
                                    end
                                else
                                    F_1 = 0
                                    new_long = XOR_STRING_DECRYPT_3(FROM_HEX('30696e7473345f74'), 69)
                                end
                            else
                                if F_1 < 1 then
                                    F_1 = 3
                                    new_ulong = XOR_STRING_DECRYPT_3(FROM_HEX('2c6e7436715f74'), 69)
                                else
                                    break
                                end
                            end
                        end
                        local F_2 = 1
                        while true do
                            if F_2 >= 1 then
                                if F_2 == 2 then
                                    break
                                else
                                    F_2 = 0
                                    newfuncstring = XOR_STRING_DECRYPT_3(FROM_HEX('2b6577'), 69)
                                end
                            else
                                F_2 = 2
                                new_long, new_ulong, new_complex = (function(_)
                                    local b = _[typeofString](_[newfuncstring](new_long));
                                    local a = _[typeofString](_[newfuncstring](new_ulong));
                                    local _ = _[typeofString](_[newfuncstring](new_complex));
                                    return b, a, _
                                end)(ffi);
                            end
                        end
                    end;
                else
                    F_4 = 2
                    if Require then
                        success, ffi = Pcall(Require, XOR_STRING_DECRYPT_3(FROM_HEX('236669'), 69));
                    end
                end
            else
                break
            end
        end
        DESERIALIZER = function()
            local prototype = {}
            prototype[3] = READ_VARINT()
            prototype[2] = READ_VARINT()
            prototype[8] = READ_VARINT()
            prototype[1] = READ_BYTE() ~= 0
            local constant_count, F_0, a, F_5, F_7, constants
            local F_18 = 0
            while true do
                if F_18 >= 2 then
                    if F_18 == 2 then
                        break
                    else
                        F_18 = 1
                        F_7 = 3
                    end
                else
                    if F_18 ~= 0 then
                        F_18 = 2
                        while true do
                            if F_7 >= 2 then
                                if F_7 == 3 then
                                    F_7 = 2
                                    constant_count, constants, a, F_0 = nil
                                else
                                    F_7 = 0
                                    F_5 = 2
                                end
                            else
                                if F_7 == 0 then
                                    F_7 = 1
                                    while true do
                                        if F_5 >= 2 then
                                            if F_5 ~= 3 then
                                                F_5 = 0
                                                constants, constant_count, a = nil
                                            else
                                                F_5 = 1
                                                while true do
                                                    if F_0 >= 2 then
                                                        if F_0 >= 3 then
                                                            if F_0 ~= 4 then
                                                                F_0 = 0
                                                                for i = 0, constant_count - 1, 1 do
                                                                    local type = READ_BYTE()
                                                                    repeat
                                                                        if type == 0 then
                                                                            (function()
                                                                                constants[i] = nil
                                                                            end)()
                                                                            break
                                                                        end
                                                                        if type == 1 then
                                                                            (function(arg)
                                                                                a = (100 - 50) / (2 + 3) * 23
                                                                                a = a + 100
                                                                                constants[i] = arg ~= 0
                                                                            end)(READ_BYTE())
                                                                            break
                                                                        end
                                                                        if type == 2 then
                                                                            (function()
                                                                                a = (100 - 50) / (2 + 3) * 23
                                                                                a = a + 100
                                                                                constants[i] = READ_INT64_LE()
                                                                            end)()
                                                                            break
                                                                        end
                                                                        if type == 3 then
                                                                            (function()
                                                                                a = (100 - 50) / (2 + 3) * 23
                                                                                a = a + 100
                                                                                constants[i] = READ_INT64_LE()
                                                                            end)()
                                                                            break
                                                                        end
                                                                        if type == 4 then
                                                                            (function()
                                                                                a = (100 - 50) / (2 + 3) * 23
                                                                                a = a + 100
                                                                            end)() -- No action, just break
                                                                            break
                                                                        end
                                                                        if type == 5 then
                                                                            (function()
                                                                                a = (100 - 50) / (2 + 3) * 23
                                                                                a = a + 100
                                                                                constants[i] = READ_STRING()
                                                                            end)()
                                                                            break
                                                                        end
                                                                        if type == 6 then
                                                                            (function(index, value)
                                                                                constants[index] = value
                                                                            end)(i, READ_DOUBLE_LE())
                                                                            break
                                                                        end
                                                                    until true
                                                                end
                                                            else
                                                                F_0 = 3
                                                                a = 0
                                                            end
                                                        else
                                                            F_0 = 4
                                                            constants = {}
                                                        end
                                                    else
                                                        if F_0 ~= 0 then
                                                            F_0 = 2
                                                            constant_count = READ_VARINT()
                                                        else
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            if F_5 < 1 then
                                                F_5 = 3
                                                F_0 = 1
                                            else
                                                break
                                            end
                                        end
                                    end
                                else
                                    break
                                end
                            end
                        end
                    else
                        F_18 = 3
                        a, constant_count, F_0, F_5, constants = nil
                    end
                end
            end
            local upvalue_count = READ_VARINT()
            local upvalues = {}
            for i = 1, upvalue_count, 1 do
                local in_stack = READ_BYTE() ~= 0
                local bit = 1
                if in_stack then
                    bit = 0
                end
                local index = READ_VARINT()
                table_insert(upvalues, { bit, index })
            end
            prototype[4] = upvalues
            local instruction_count = READ_VARINT()
            local instructions = {}
            for i = 0, instruction_count - 1, 1 do
                local new_instruction = {}
                new_instruction[2] = READ_VARINT()
                local is_ka = READ_BYTE() ~= 0
                local is_kb = READ_BYTE() ~= 0
                local is_kc = READ_BYTE() ~= 0
                new_instruction[4] = READ_VARINT()
                new_instruction[7] = READ_VARINT()
                new_instruction[5] = READ_VARINT()
                if is_ka then
                    new_instruction[6] = constants[new_instruction[4]]
                end
                if is_kb then
                    new_instruction[1] = constants[new_instruction[7]]
                end
                if is_kc then
                    new_instruction[3] = constants[new_instruction[5]]
                end
                instructions[i] = new_instruction
            end
            prototype[6] = instructions
            local prototype_count = READ_VARINT()
            local prototypes = {}
            for i = 0, prototype_count - 1, 1 do
                prototypes[i] = DESERIALIZER()
            end
            prototype[5] = prototypes
            return prototype
        end
    end
    local PROTO = DESERIALIZER();
    return INTERPRETER(PROTO, {})
end)({})(...)