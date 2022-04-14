struct SegTree{T,OP}
    n::Int
    tn::Int
    tlog::Int
    op::OP
    e::T
    data::Vector{T}
    function SegTree(x::AbstractVector{T}, op::OP, e::T) where {T,OP}
        @assert op(e, e) == e
        n = length(x)
        tlog = 0
        while 1 << tlog < n
            tlog += 1
        end
        tn = 1 << tlog - 1
        data = fill(e, 2 * tn + 1)
        data[tn+1:tn+n] = x
        for i in Iterators.reverse(1:tn)
            data[i] = op(data[2*i], data[2*i+1])
        end
        new{T,OP}(n, tn, tlog, op, e, data)
    end
    SegTree(n::Int, op::OP, e::T) where {T,OP} = SegTree(fill(e, n), op, e)
end

function Base.setindex!(seg::SegTree, x, i::Int)
    @boundscheck checkbounds(seg.data, i)
    i += seg.tn
    seg.data[i] = x
    for k in 1:seg.tlog
        j = i >> k
        seg.data[j] = seg.op(seg.data[2*j], seg.data[2*j+1])
    end
    x
end

Base.getindex(seg::SegTree, i::Int) = seg.data[seg.tn+i]

function partialprod(seg::SegTree, I::AbstractUnitRange{Int})
    l, r = first(I), last(I)
    l ≤ r || return seg.e
    (1 ≤ l && r ≤ seg.n) || throw(BoundsError())
    # search [l, r)
    l += seg.tn
    r += seg.tn + 1
    sml = seg.e
    smr = seg.e
    while l < r
        if !iszero(l & 1)
            sml = seg.op(sml, seg.data[l])
            l += 1
        end
        if !iszero(r & 1)
            r -= 1
            smr = seg.op(seg.data[r], smr)
        end
        l >>= 1
        r >>= 1
    end
    seg.op(sml, smr)
end

Base.prod(seg::SegTree) = seg.data[1]

function max_right(seg::SegTree, f::Function, l::Int)
    @boundscheck checkbounds(seg.data, l)
    @assert f(seg.e)
    l += seg.tn
    s = seg.e
    while true
        while l & 1 == 0
            l >>= 1
        end
        if !(f(seg.op(s, seg.data[l])))
            while l ≤ seg.tn
                l <<= 1
                opv = seg.op(s, seg.data[l])
                if f(opv)
                    s = opv
                    l += 1
                end
            end
            return l - seg.tn - 1
        end
        s = seg.op(s, seg.data[l])
        l += 1
        l & -l == l && break
    end
    seg.n
end

function min_left(seg::SegTree, f::Function, r::Int)
    @boundscheck checkbounds(seg.data, r)
    @assert f(seg.e)
    r == 1 && return 1
    r += seg.tn + 1
    s = seg.e
    while true
        r -= 1
        while r > 1 && r & 1 == 1
            r >>= 1
        end
        if !(f(seg.op(seg.data[r], s)))
            while r ≤ seg.tn
                r = 2 * r + 1
                opv = seg.op(seg.data[r], s)
                if f(opv)
                    s = opv
                    r -= 1
                end
            end
            return r - seg.tn
        end
        s = seg.op(seg.data[r], s)
        r & -r == r && break
    end
    1
end

struct Rect
    h::Int
    w::Int
    box::Bool
end

function compress(xs, ys)
    xys = vcat(xs, ys)
    sort!(xys)
    unique!(xys)
    xs = [searchsortedfirst(xys, x) for x in xs]
    ys = [searchsortedfirst(xys, y) for y in ys]
    xs, ys
end

function solve(n, m, as, bs, cs, ds)
    as, cs = compress(as, cs)
    bs, ds = compress(bs, ds)

    rs = Rect[]
    for i in 1:n
        push!(rs, Rect(as[i], bs[i], false))
    end
    for i in 1:m
        push!(rs, Rect(cs[i], ds[i], true))
    end
    sort!(rs, by=x -> (x.h, x.box, x.w), rev=true)

    seg = SegTree(n + m, max, 0)
    for r in rs
        if r.box
            seg[r.w] = seg[r.w] + 1
        else
            right = max_right(seg, iszero, r.w)
            if right == n + m
                return false
            else
                seg[right+1] = seg[right+1] - 1
            end
        end
    end
    true
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    ds = parse.(Int64, split(readline()))
    println(solve(n, m, as, bs, cs, ds) ? "Yes" : "No")
end

main()
