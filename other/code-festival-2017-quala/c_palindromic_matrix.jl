parseints() = parse.(Int, split(readline()))
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

function solve(h, w, ss)
    chs = Dict{Char,Int}()
    for i in 1:h
        for j in 1:w
            s = ss[i][j]
            chs[s] = get(chs, s, 0) + 1
        end
    end

    tc1 = 0
    tc2 = 0
    for (c, v) in pairs(chs)
        a, r = divrem(v, 4)
        if r == 1
            tc1 += 1
        elseif r == 2
            tc2 += 1
        elseif r == 3
            tc1 += 1
            tc2 += 1
        end
    end

    t1 = (h % 2) * (w % 2)
    t4 = (h - h % 2) * (w - w % 2)
    t2 = h * w - t1 - t4

    ifelse(tc1 ≤ t1 && tc2 ≤ (t2 ÷ 2), "Yes", "No")
end

function main()
    h, w = parseints()
    ss = parsestrings(h)
    solve(h, w, ss) |> println
end

main()
