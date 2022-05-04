using DataStructures

const N = 2^20

function inc!(ds, vm, cind, x)
    ind = mod(x, N)

    if ind in ds
        rh = find_root!(ds, ind)
        ind = cind[rh]
    end

    vm[ind] = x
    cnum = push!(ds, ind)
    next_ind = mod(ind + 1, N)

    prev = mod(ind - 1, N)
    if prev in ds
        cnum = union!(ds, ind, prev)
    end

    next = mod(ind + 1, N)
    if next in ds
        next_ind = cind[find_root!(ds, next)]
        cnum = union!(ds, ind, next)
    end

    cind[cnum] = next_ind
end

function solve(q, ts, xs)
    ds = DisjointSets{Int}()
    vm = Dict{Int,Int}()
    cind = Dict{Int,Int}()
    for i in 1:q
        if ts[i] == 1
            inc!(ds, vm, cind, xs[i])
        else
            println(get(vm, mod(xs[i], N), -1))
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
