struct UnionFind{T}
    parents::Dict{T,T}
end

UnionFind{T}() where {T} = UnionFind(Dict{T,T}())

function root!(uf::UnionFind, x)
    haskey(uf.parents, x) || return nothing
    uf.parents[x] == x && return x
    uf.parents[x] = root!(uf, uf.parents[x])
end

function union!(uf::UnionFind, x, y)
    haskey(uf.parents, x) || return
    haskey(uf.parents, y) || return
    rx = root!(uf, x)
    ry = root!(uf, y)
    rx != ry && (uf.parents[rx] = ry)
end

function add!(uf::UnionFind, x)
    uf.parents[x] = x
end

function main()
    h, w = parse.(Int64, split(readline()))
    n = parse(Int64, readline())
    uf = UnionFind{Tuple{Int64,Int64}}()
    for i in 1:n
        input = parse.(Int64, split(readline()))
        t = first(input)
        if t == 1
            x = (input[2], input[3])
            add!(uf, x)
            union!(uf, x, x .+ (-1, 0))
            union!(uf, x, x .+ (1, 0))
            union!(uf, x, x .+ (0, -1))
            union!(uf, x, x .+ (0, 1))
        else
            x = (input[2], input[3])
            y = (input[4], input[5])
            rx = root!(uf, x)
            ry = root!(uf, y)
            !isnothing(rx) && !isnothing(ry) && rx == ry ? println("Yes") : println("No")
        end
    end
end

main()
