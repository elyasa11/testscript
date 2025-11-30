--[[
    SCRIPT DIAGNOSA: WRITE TEST
    Tujuan: Memastikan fungsi writefile() berjalan.
]]

local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

print("--- MULAI TES TULIS FILE ---")

-- Nama file tes
local fileName = "tes_diagnosa.json"
local isiFile = {
    pesan = "Halo, ini tes menulis file.",
    waktu = os.time(),
    akun = game.Players.LocalPlayer.Name
}

-- Coba Tulis File
local success, err = pcall(function()
    writefile(fileName, HttpService:JSONEncode(isiFile))
end)

-- Cek Hasilnya
if success then
    print("✅ SUKSES: Fungsi writefile berjalan tanpa error.")
    print("   File: " .. fileName)
    
    StarterGui:SetCore("SendNotification", {
        Title = "TES BERHASIL",
        Text = "Cek folder Delta/Workspace sekarang!",
        Duration = 10
    })
else
    print("❌ GAGAL: Terjadi error saat menulis file.")
    warn("Error Detail: " .. tostring(err))
    
    StarterGui:SetCore("SendNotification", {
        Title = "TES GAGAL",
        Text = "Cek Console (F9) untuk error.",
        Duration = 10
    })
end

print("--- SELESAI ---")
