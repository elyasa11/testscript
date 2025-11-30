--[[
    SCRIPT UJI COBA: SIMULASI FREEZE
    Tujuan: Mengetes apakah Python mendeteksi jika file berhenti update.
]]

local Http = game:GetService("HttpService")
local Players = game:GetService("Players")

local myUser = Players.LocalPlayer.Name
local myStatusFile = "status_" .. myUser .. ".json"

print("--- UJI COBA: SAYA AKAN 'FREEZE' DALAM 10 DETIK ---")

task.spawn(function()
    local count = 0
    while true do
        count = count + 1
        
        -- A. UPDATE STATUS NORMAL (Selama 10 detik pertama)
        if count <= 3 then
            local data = {
                username = myUser,
                jobId = game.JobId,
                timestamp = os.time(), -- Waktu terus update
                status = "ACTIVE"
            }
            writefile(myStatusFile, Http:JSONEncode(data))
            print("✅ [LUA] Detak Jantung Normal... (" .. count .. ")")
        
        -- B. SIMULASI FREEZE (Setelah detik ke-10)
        else
            print("❌ [LUA] SIMULASI FREEZE! SAYA BERHENTI UPDATE FILE SEKARANG.")
            print("   Harusnya Python mendeteksi ini dalam 2 menit...")
            
            -- Kita menulis file TERAKHIR kali, lalu diam selamanya.
            -- Python akan melihat timestamp file ini makin lama makin tua.
            local data = {
                username = myUser,
                jobId = game.JobId,
                timestamp = os.time(), -- Waktu berhenti di sini
                status = "FROZEN_TEST"
            }
            writefile(myStatusFile, Http:JSONEncode(data))
            
            -- TIDUR SELAMANYA (Script berhenti total)
            while true do task.wait(9999) end
        end

        task.wait(5) -- Loop setiap 5 detik
    end
end)
