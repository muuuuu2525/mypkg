import rclpy
from rclpy.node import Node
from person_msgs.srv import Query

def cb(request, response):
    if request.name == "浅野真夢":
        response.age = 19
    else:
        response.age = 255

    return response

def main():
    rclpy.init()
    node = Node("talker")
    srv = node.create_service(Query, "query", cb) # サービスの作成
    rclpy.spin(node)
