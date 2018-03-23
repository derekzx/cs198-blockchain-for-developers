from utils import *
import math
from node import Node


def merkle_proof(tx, merkle_tree):
    """Given a tx and a Merkle tree object, retrieve its list of tx's and
    parse through it to arrive at the minimum amount of information required
    to arrive at the correct block header. This does not include the tx
    itself.

    Return this data as a list; remember that order matters!
    """
    #### YOUR CODE HERE
    leaves = merkle_tree.leaves
    tx_pos = merkle_tree.leaves.index(tx)
    tree_size = len(merkle_tree.leaves)

    answer = []

    original_leaves = leaves
    depth = 0

    while (tree_size!=1):
        tree_size //=2
        depth += 1
        if tree_size == 1:
            if tx_pos %2 == 0:   #if second leaf
                final_tx = leaves[tx_pos+1]
                # final_tx_position = original_leaves.index(final_tx)
                # tx = 'tx'+str(final_tx_position+1)
                node = Node(depth, 'r', final_tx) #First leaf
                answer.append(node)
            else:                #tx is first leaf
                final_tx = leaves[tx_pos-1]
                # final_tx_position = original_leaves.index(final_tx)
                # tx = 'tx'+str(final_tx_position+1)
                node = Node(depth, 'l', final_tx) #Second leaf
                answer.append(node)
        else:
            if tx in leaves[:tree_size]:
                hash = concat_and_hash_list(leaves[tree_size:])
                node = Node(depth, 'r', hash)
                answer.append(node)
            else:
                hash = concat_and_hash_list(leaves[:tree_size])
                node = Node(depth, 'l', hash)
                answer.append(node)
    return answer



def get_max_depth_node(nodes):
    """Helper function to retrieve the node with the maximum depth.
    Helpful for pairing nodes for hashing in verify_proof"""
    curr = nodes[0]
    for i in range(0, len(nodes)):
        if nodes[i].depth > curr.depth:
            curr = nodes[i]
    return curr


def verify_proof(tx, merkle_proof):
    """Given a Merkle proof - constructed via `merkle_proof(...)` - verify
    that the correct block header can be retrieved by properly hashing the tx
    along with every other piece of data in the proof in the correct order
    """
    #### YOUR CODE HERE
    #Merkle proof --> list of nodes


    while (len(merkle_proof) != 0):
        node = merkle_proof[-1]
        if (node.direction == 'r') :
            # print("i am hashing" + node.tx + "and" + tx)
            tx = concat_and_hash_list([tx, node.tx])
        elif (node.direction == 'l') :
            # print("i am hashing" + node.tx + "and" + tx)
            tx = concat_and_hash_list([node.tx,tx])
        else:
            raise AttributeError
        merkle_proof = merkle_proof[:-1]
    
    print("answer is " + tx)
    return tx



    
