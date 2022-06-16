parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function interp(ts, gs, x)
    ind = searchsortedlast(ts, x)
    gs[ind] + x - ts[ind]
end

function solve(n, m, as, xs, ys)
    zs = xs .- ys

    # compression
    ts = [0]
    for x in xs
        push!(ts, x)
        push!(ts, x + 1)
    end
    unique!(ts)
    sort!(ts)

    # rejected[j] = {z_i|x_i=j}
    rejected = Dict{Int,Vector{Int}}()
    for i in 1:m
        if !haskey(rejected, xs[i])
            rejected[xs[i]] = Int[]
        end
        push!(rejected[xs[i]], zs[i])
    end

    gs = zero(ts)
    hs = zero(ts)

    x_set = Set(xs)
    k_count = Dict{Int,Int}()

    for i in 2:length(ts)
        if ts[i] ∉ x_set
            gs[i] = hs[i] = hs[i-1] + ts[i] - ts[i-1]
        else
            # ts ∈ X
            ct = Dict{Int,Int}()
            for r in rejected[ts[i]]
                g = interp(ts, gs, r)
                ct[g] = get(ct, g, 0) + 1
            end
            new_g = typemax(Int)
            for (k, v) in pairs(ct)
                if !haskey(k_count, k) || k_count[k] == v
                    new_g = min(new_g, k)
                end
            end
            if new_g == typemax(Int)
                gs[i] = hs[i] = hs[i-1] + ts[i] - ts[i-1]
            else
                gs[i] = new_g
                hs[i] = hs[i-1] + ts[i] - ts[i-1] - 1
                k_count[new_g] = get(k_count, new_g, 1) + 1
            end
        end
    end

    res = 0
    for a in as
        res ⊻= interp(ts, gs, a)
    end
    ifelse(res != 0, "Takahashi", "Aoki")
end

function main()
    n, m = parseints()
    as = parseints()
    xs, ys = parsepoints(m)
    solve(n, m, as, xs, ys) |> println
end

main()
