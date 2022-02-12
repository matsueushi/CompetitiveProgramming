struct LazySegmentTree
    tree::Vector{Int64}
    lazy::Vector{Int64}
    n::Int64
    tsize::Int64
end

function LazySegmentTree(n)
    tsize = 1
    while tsize < n
        tsize *= 2
    end
    tree = zeros(Int64, 2 * tsize - 1)
    lazy = zeros(Int64, 2 * tsize - 1)
    LazySegmentTree(tree, lazy, n, tsize)
end

function evaluate!(st::LazySegmentTree, k)
    st.lazy[k] == 0 && return
    if k < st.tsize
        st.lazy[2*k] = st.lazy[k]
        st.lazy[2*k+1] = st.lazy[k]
    end
    st.tree[k] = st.lazy[k]
    st.lazy[k] = 0
end

function update!(st::LazySegmentTree, a, b, k, l, r, x)
    evaluate!(st, k)
    (r < a || b < l) && return
    if a ≤ l && r ≤ b
        st.lazy[k] = x
        evaluate!(st, k)
    else
        update!(st, a, b, 2 * k, l, (l + r) ÷ 2, x)
        update!(st, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r, x)
        st.tree[k] = max(st.tree[2*k], st.tree[2*k+1])
    end
end

update!(st::LazySegmentTree, a, b, x) = update!(st, a, b, 1, 1, st.tsize, x)

function query(st::LazySegmentTree, a, b, k, l, r)
    (r < a || b < l) && return 0
    evaluate!(st, k)
    (a ≤ l && r ≤ b) && return st.tree[k]
    vl = query(st, a, b, 2 * k, l, (l + r) ÷ 2)
    vr = query(st, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r)
    max(vl, vr)
end

query(st::LazySegmentTree, a, b) = query(st, a, b, 1, 1, st.tsize)

function long_bricks(w, ls, rs)
    segtree = LazySegmentTree(w)
    for (l, r) in zip(ls, rs)
        h = query(segtree, l, r)
        update!(segtree, l, r, h + 1)
        println(h + 1)
    end
end

function main()
    w, n = parse.(Int64, split(readline()))
    ls = zeros(Int64, n)
    rs = zeros(Int64, n)
    for i in 1:n
        ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    long_bricks(w, ls, rs)
end

main()
