function normalize(x)
    l = length(x)
    ns = zeros(Int, l)
    d = Dict{Char,Int}()
    c = 0
    for i in 1:l
        if !haskey(d, x[i])
            c += 1
            d[x[i]] = c
        end
        ns[i] = d[x[i]]
    end
    ns
end

function main()
    s = readline()
    t = readline()
    println(ifelse(normalize(s) == normalize(t), "Yes", "No"))
end

main()
