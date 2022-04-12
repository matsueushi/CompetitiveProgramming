function gravy_jobs(ds, cs, ss)
    # filter
    val = cs .≤ ds
    n = sum(val)
    n == 0 && return 0
    ds = ds[val]
    cs = cs[val]
    ss = ss[val]

    perm = sortperm(ds)
    ds = ds[perm]
    cs = cs[perm]
    ss = ss[perm]

    mds = ds[n]
    state = zeros(Int64, mds)
    state[cs[1]:ds[1]] .= ss[1]
    for i in 2:n
        workistate = zeros(Int64, mds)
        workistate[cs[i]:ds[i]] .= ss[i]
        workistate[cs[i]+1:ds[i]] += accumulate(max, state[1:ds[i]-cs[i]])
        state = max.(state, workistate)
    end
    maximum(state)
end

function main()
    n = parse.(Int64, readline())
    ds = zeros(Int64, n)
    cs = zeros(Int64, n)
    ss = zeros(Int64, n)
    for i in 1:n
        d, c, s = parse.(Int64, split(readline()))
        ds[i] = d
        cs[i] = c
        ss[i] = s
    end
    println(gravy_jobs(ds, cs, ss))
end

main()