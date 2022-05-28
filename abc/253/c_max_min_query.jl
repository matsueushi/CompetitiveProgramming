using DataStructures

parseint() = parse(Int, readline())

function main()
    q = parseint()
    ss = SortedSet{Int}()
    d = Dict{Int,Int}()
    for i in 1:q
        ins = split(readline())
        t = first(ins)
        if t == "1"
            x = parse(Int, ins[2])
            push!(ss, x)
            d[x] = get(d, x, 0) + 1
        elseif t == "2"
            x = parse(Int, ins[2])
            c = parse(Int, ins[3])
            deln = min(c, get(d, x, 0))
            deln == 0 && continue
            d[x] -= deln
            d[x] == 0 && (pop!(ss, x))
        else
            println(last(ss) - first(ss))
        end
    end
end

main()
