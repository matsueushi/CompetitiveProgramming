function solve(s)
    s = "X" * s * "X"
    cs = Char[]
    ds = Int[]
    x = 0
    for i in 1:length(s)
        if s[i] == 'x'
            x += 1
        else
            push!(cs, s[i])
            if i != 1
                push!(ds, x)
            end
            x = 0
        end
    end
    cs != reverse(cs) && return -1
    res = 0
    l = length(ds)
    for i in 1:l>>1
        res += abs(ds[i] - ds[l-i+1])
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
