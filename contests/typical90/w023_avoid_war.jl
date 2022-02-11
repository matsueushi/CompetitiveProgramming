const p = 10^9 + 7

struct Pattern
    w::Int64
    xs::Vector{Int64}
    vs::Vector{Int64}
    idx::Dict{Int64,Int64}
    trs0::Vector{Int64}
    trs1::Vector{Union{Int64,Nothing}}
end

Pattern(w) = Pattern(w, Int64[], Int64[], Dict(), Int64[], Union{Int64,Nothing}[])

function candidates!(ptn::Pattern, x, i, w)
    count_ones(x & (x << 1)) ≤ 1 || return
    if i == w + 1
        iszero(x & x << w) || return
        valid = -1
        cp = x & x >> 1
        iszero(cp) || (valid &= cp)
        cx = x & x >> (w - 1)
        if !iszero(cx)
            if isodd(cx)
                valid &= 1 << (w - 1)
            else
                valid &= 1
            end
        end
        # println((bitstring(x), bitstring(cp), bitstring(cx)))
        push!(ptn.xs, x)
        push!(ptn.vs, valid)
        # println("aaa", (bitstring(x), bitstring(valid)))
        return
    end
    candidates!(ptn, x << 1, i + 1, w)
    candidates!(ptn, x << 1 + 1, i + 1, w)
end

function setindex!(ptn::Pattern)
    for (i, v) in enumerate(ptn.xs)
        push!(ptn.idx, v => i)
    end
end

function filltransition!(ptn::Pattern)
    mask = 1 << (ptn.w + 1) - 1
    for x in ptn.xs
        t0 = x << 1 & mask
        t1 = t0 + 1
        push!(ptn.trs0, ptn.idx[t0])
        push!(ptn.trs1, get(ptn.idx, t1, nothing))
    end
end

function avoid_war(h, w, grid)
    # println((h, w, grid))
    ptn = Pattern(w)
    candidates!(ptn, 0, 0, w)
    setindex!(ptn)
    filltransition!(ptn)

    # println(bitstring.(ptn.xs))
    # println(ptn)

    cs = zero(ptn.xs)
    nextcs = zero(ptn.xs)
    cs[ptn.idx[0]] = 1
    nxs = length(ptn.xs)

    for j in 1:w
        for i in 1:h
            for ix in 1:nxs
                cs[ix] == 0 && continue
                t0 = ptn.trs0[ix]
                t1 = ptn.trs1[ix]
                nextcs[t0] += cs[ix]
                nextcs[t0] %= p
                if iszero(grid[i, j]) && !isnothing(t1)
                    isvalid = isodd(ptn.vs[t1] >> (j - 1))
                    isvalid && (nextcs[t1] += cs[ix]; nextcs[t1] %= p)
                end
            end
            cs, nextcs = nextcs, cs
            # println((i, j, grid[i, j]), cs, nextcs)
            fill!(nextcs, 0)
        end
    end

    total = 0
    for c in cs
        total += c
        total %= p
    end
    total
end

function main()
    h, w = parse.(Int64, split(readline()))
    grid = zeros(Int64, (h, w))
    for i in 1:h
        s = readline()
        s = replace(s, '.' => '0')
        s = replace(s, '#' => '1')
        grid[i, :] = parse.(Int64, split(s, ""))
    end
    println(avoid_war(h, w, grid))
end

main()
