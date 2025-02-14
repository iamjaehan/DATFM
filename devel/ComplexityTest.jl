using datfm
using MAT
using StatsBase

# n = [10, 20, 30, 40, 50]
# m = [3,9,27,81,243]

# n = 3:10
# m = 3:10

# n = Int.(floor.(LinRange(10,50,8)))
# m = Int.(floor.(LinRange(5,50,8)))

n = 3:2:15
m = 100:100:3000

record = Array{Float64}(undef, (size(n)[1], size(m)[1]))

function FakeSetGame(n)
    return (; n)
end

global count = 0
for i in 1:length(n)
    for j in 1:length(m)
        global count = count + 1
        gameInfo = FakeSetGame(n[i])
        GenFakePrivatePref(gameInfo, 1, 10)
        C = GenerateRandomChoices(n[i],m[j])
        out = @timed RunDiscAuction(gameInfo, m[j], C, GetPrivatePref(), 10, Inf, 0.9)
        record[i,j] = out.time
        if out.value.flag
            record[i,j] = Inf
        end
        println("Test number $(count)/$(length(n)*length(m)) done. n = $(n[i]), m=$(m[j])")
    end
end

global record

matwrite("Analysis/[1]_Time.mat",Dict(
    "Time" => record
); version="v7.4")