using DataStructures

const N = 2^20

function solve(q, ts, xs)
    lset = SortedSet{Int}([0])
    idict = Dict{Int,Int}([0 => N - 1])
    vals = Dict{Int,Int}()
    for i in 1:q
        h = xs[i] % N
        if ts[i] == 1
            tok = searchsortedlast(lset, h)
            if tok == beforestartsemitoken(lset)
                tok = startof(lset)
                h = deref((lset, tok))
            end
            l = deref((lset, tok))
            r = idict[l]
            if r < h
                if tok == lastindex(lset)
                    tok = startof(lset)
                else
                    tok = advance((lset, tok))
                end
                l = h = deref((lset, tok))
                r = idict[l]
            end
            pop!(lset, l)
            pop!(idict, l)
            if l < h
                push!(lset, l)
                idict[l] = h - 1
            end
            if h < r
                push!(lset, h + 1)
                idict[h+1] = r
            end
            vals[h] = xs[i]
        else
            println(get(vals, h, -1))
        end
    end
end

function main()
    q = parse(Int, readline())
    ts, xs = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        ts[i], xs[i] = parse.(Int, split(readline()))
    end
    solve(q, ts, xs)
end

main()
